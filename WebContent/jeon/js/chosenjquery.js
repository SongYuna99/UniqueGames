(function() {
      var a;
      a = (function() {
            function b() {
              this.options_index = 0;
              this.parsed = []
            }
            b.prototype.add_node = function(c) {
              if (c.nodeName === "OPTGROUP") {
                return this.add_group(c)
              } else {
                return this.add_option(c)
              }
            }
            ;
            b.prototype.add_group = function(i) {
              var h, e, g, d, f, c;
              h = this.parsed.length;
              this.parsed.push({
                array_index: h,
                group: true,
                label: i.label,
                children: 0,
                disabled: i.disabled
              });
              f = i.childNodes;
              c = [];
              for (g = 0,
                  d = f.length; g < d; g++) {
                e = f[g];
                c.push(this.add_option(e, h, i.disabled))
              }
              return c
            }
            ;
            b.prototype.add_option = function(d, e, c) {
              if (d.nodeName === "OPTION") {
                if (d.text !== "") {
                  if (e != null) {
                    this.parsed[e].children += 1
                  }
                  this.parsed.push({
                    array_index: this.parsed.length,
                    options_index: this.options_index,
                    value: d.value,
                    text: d.text,
                    html: d.innerHTML,
                    selected: d.selected,
                    disabled: c === true ? c : d.disabled,
                    group_array_index: e,
                    classes: d.className,
                    style: d.style.cssText
                  })
                } else {
                  this.parsed.push({
                    array_index: this.parsed.length,
                    options_index: this.options_index,
                    empty: true
                  })
                }
                return this.options_index += 1
              }
            }
            ;
            return b
          }
      )();
      a.select_to_array = function(b) {
        var g, f, e, c, d;
        f = new a();
        d = b.childNodes;
        for (e = 0,
            c = d.length; e < c; e++) {
          g = d[e];
          f.add_node(g)
        }
        return f.parsed
      }
      ;
      this.SelectParser = a
    }
).call(this);
(function() {
      var b, a;
      a = this;
      b = (function() {
            function c(d, e) {
              this.form_field = d;
              this.options = e != null ? e : {};
              this.set_default_values();
              this.setup();
              this.set_up_html();
              this.register_observers();
              this.finish_setup()
            }
            c.prototype.set_default_values = function() {
              var d = this;
              this.is_multiple = this.form_field.multiple;
              this.default_text_default = this.is_multiple ? this.options.select_some_options_text || "Select Some Options" : this.options.select_an_option_text || "Select an Option";
              this.Select_all_text_default = this.options.select_all_text || "Select all options";
              this.click_test_action = function(e) {
                return d.test_active_click(e)
              }
              ;
              this.activate_action = function(e) {
                return d.activate_field(e)
              }
              ;
              this.active_field = false;
              this.mouse_on_container = false;
              this.results_showing = false;
              this.result_highlighted = null;
              this.result_single_selected = null;
              this.allow_single_deselect = (this.options.allow_single_deselect != null) && (this.form_field.options[0] != null) && this.form_field.options[0].text === "" ? this.options.allow_single_deselect : false;
              this.disable_search_threshold = this.options.disable_search_threshold || 0;
              this.enable_select_all = (this.options.enable_select_all != null) && this.is_multiple ? this.options.enable_select_all : false;
              this.choices = 0;
              return this.results_none_found = this.options.no_results_text || "No results match"
            }
            ;
            c.prototype.mouse_enter = function() {
              return this.mouse_on_container = true
            }
            ;
            c.prototype.mouse_leave = function() {
              return this.mouse_on_container = false
            }
            ;
            c.prototype.input_focus = function(d) {
              var e = this;
              if (!this.active_field) {
                return setTimeout((function() {
                      return e.container_mousedown()
                    }
                ), 50)
              }
            }
            ;
            c.prototype.input_blur = function(d) {
              var e = this;
              if (!this.mouse_on_container) {
                this.active_field = false;
                return setTimeout((function() {
                      return e.blur_test()
                    }
                ), 100)
              }
            }
            ;
            c.prototype.result_add_option = function(f) {
              var d, e;
              if (!f.disabled) {
                f.dom_id = this.container_id + "_o_" + f.array_index;
                d = f.selected && this.is_multiple ? [] : ["active-result"];
                if (f.selected) {
                  d.push("result-selected")
                }
                if (f.group_array_index != null) {
                  d.push("group-option")
                }
                if (f.classes !== "") {
                  d.push(f.classes)
                }
                e = f.style.cssText !== "" ? ' style="' + f.style + '"' : "";
                return '<li id="' + f.dom_id + '" class="' + d.join(" ") + '"' + e + ">" + f.html + "</li>"
              } else {
                return ""
              }
            }
            ;
            c.prototype.results_update_field = function() {
              this.result_clear_highlight();
              this.result_single_selected = null;
              return this.results_build()
            }
            ;
            c.prototype.results_toggle = function() {
              if (this.results_showing) {
                return this.results_hide()
              } else {
                return this.results_show()
              }
            }
            ;
            c.prototype.results_search = function(d) {
              if (this.results_showing) {
                return this.winnow_results()
              } else {
                return this.results_show()
              }
            }
            ;
            c.prototype.keyup_checker = function(d) {
              var f, e;
              f = (e = d.which) != null ? e : d.keyCode;
              this.search_field_scale();
              switch (f) {
                case 8:
                  if (this.is_multiple && this.backstroke_length < 1 && this.choices > 0) {
                    this.keydown_backstroke()
                  } else {
                    if (!this.pending_backstroke) {
                      this.result_clear_highlight();
                      this.results_search()
                    }
                  }
                  break;
                case 13:
                  d.preventDefault();
                  if (this.results_showing) {
                    this.result_select(d)
                  }
                  break;
                case 27:
                  if (this.results_showing) {
                    this.results_hide()
                  }
                  return true;
                case 9:
                case 38:
                case 40:
                case 16:
                case 91:
                case 17:
                  break;
                default:
                  this.results_search()
              }
              if (this.enable_select_all) {
                return this.select_all_toggle()
              }
            }
            ;
            c.prototype.generate_field_id = function() {
              var d;
              d = this.generate_random_id();
              this.form_field.id = d;
              return d
            }
            ;
            c.prototype.generate_random_char = function() {
              var f, e, d;
              f = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
              d = Math.floor(Math.random() * f.length);
              return e = f.substring(d, d + 1)
            }
            ;
            return c
          }
      )();
      a.AbstractChosen = b
    }
).call(this);
(function() {
      var e, f, d, a, b = Object.prototype.hasOwnProperty, c = function(j, h) {
        for (var g in h) {
          if (b.call(h, g)) {
            j[g] = h[g]
          }
        }
        function i() {
          this.constructor = j
        }
        i.prototype = h.prototype;
        j.prototype = new i;
        j.__super__ = h.prototype;
        return j
      };
      a = this;
      e = jQuery;
      e.fn.extend({
        chosen: function(g) {
          if (e.browser.msie && (e.browser.version === "6.0" || e.browser.version === "7.0")) {
            return this
          }
          return e(this).each(function(h) {
            if (!(e(this)).hasClass("chzn-done")) {
              return new f(this,g)
            }
          })
        }
      });
      f = (function(g) {
            c(h, g);
            function h() {
              h.__super__.constructor.apply(this, arguments)
            }
            h.prototype.setup = function() {
              this.form_field_jq = e(this.form_field);
              return this.is_rtl = this.form_field_jq.hasClass("chzn-rtl")
            }
            ;
            h.prototype.finish_setup = function() {
              return this.form_field_jq.addClass("chzn-done")
            }
            ;
            h.prototype.set_up_html = function() {
              var l, k, j, i;
              this.container_id = this.form_field.id.length ? this.form_field.id.replace(/(:|\.)/g, "_") : this.generate_field_id();
              this.container_id += "_chzn";
              this.f_width = this.form_field_jq.outerWidth();
              this.default_text = this.form_field_jq.data("placeholder") ? this.form_field_jq.data("placeholder") : this.default_text_default;
              l = e("<div />", {
                id: this.container_id,
                "class": "chzn-container" + (this.is_rtl ? " chzn-rtl" : ""),
                style: "width: " + this.f_width + "px;"
              });
              if (this.is_multiple) {
                l.html('<ul class="chzn-choices"><li class="search-field"><input type="text" value="' + this.default_text + '" class="default" autocomplete="off" style="width:25px;" /></li></ul><div class="chzn-drop" style="left:-9000px;"><ul class="chzn-results"></ul></div>')
              } else {
                l.html('<a href="javascript:void(0)" class="chzn-single"><span>' + this.default_text + '</span><div><b></b></div></a><div class="chzn-drop" style="left:-9000px;"><div class="chzn-search"><input type="text" autocomplete="off" /></div><ul class="chzn-results"></ul></div>')
              }
              this.form_field_jq.hide().after(l);
              this.container = e("#" + this.container_id);
              this.container.addClass("chzn-container-" + (this.is_multiple ? "multi" : "single"));
              this.dropdown = this.container.find("div.chzn-drop").first();
              if (this.enable_select_all) {
                this.select_all_setup()
              }
              k = this.container.height();
              j = this.f_width - d(this.dropdown);
              this.dropdown.css({
                width: j + "px",
                top: k + "px"
              });
              this.search_field = this.container.find("input").first();
              this.search_results = this.container.find("ul.chzn-results").first();
              this.search_field_scale();
              this.search_no_results = this.container.find("li.no-results").first();
              if (this.is_multiple) {
                this.search_choices = this.container.find("ul.chzn-choices").first();
                this.search_container = this.container.find("li.search-field").first()
              } else {
                this.search_container = this.container.find("div.chzn-search").first();
                this.selected_item = this.container.find(".chzn-single").first();
                i = j - d(this.search_container) - d(this.search_field);
                this.search_field.css({
                  width: i + "px"
                })
              }
              this.results_build();
              this.set_tab_index();
              return this.form_field_jq.trigger("liszt:ready", {
                chosen: this
              })
            }
            ;
            h.prototype.register_observers = function() {
              var i = this;
              this.container.mousedown(function(j) {
                return i.container_mousedown(j)
              });
              this.container.mouseup(function(j) {
                return i.container_mouseup(j)
              });
              this.container.mouseenter(function(j) {
                return i.mouse_enter(j)
              });
              this.container.mouseleave(function(j) {
                return i.mouse_leave(j)
              });
              this.search_results.mouseup(function(j) {
                return i.search_results_mouseup(j)
              });
              this.search_results.mouseover(function(j) {
                return i.search_results_mouseover(j)
              });
              this.search_results.mouseout(function(j) {
                return i.search_results_mouseout(j)
              });
              this.form_field_jq.bind("liszt:updated", function(j) {
                return i.results_update_field(j)
              });
              this.search_field.blur(function(j) {
                return i.input_blur(j)
              });
              this.search_field.keyup(function(j) {
                return i.keyup_checker(j)
              });
              this.search_field.keydown(function(j) {
                return i.keydown_checker(j)
              });
              if (this.is_multiple) {
                this.search_choices.click(function(j) {
                  return i.choices_click(j)
                });
                return this.search_field.focus(function(j) {
                  return i.input_focus(j)
                })
              } else {
                return this.container.click(function(j) {
                  return j.preventDefault()
                })
              }
            }
            ;
            h.prototype.search_field_disabled = function() {
              this.is_disabled = this.form_field_jq[0].disabled;
              if (this.is_disabled) {
                this.container.addClass("chzn-disabled");
                this.search_field[0].disabled = true;
                if (!this.is_multiple) {
                  this.selected_item.unbind("focus", this.activate_action)
                }
                return this.close_field()
              } else {
                this.container.removeClass("chzn-disabled");
                this.search_field[0].disabled = false;
                if (!this.is_multiple) {
                  return this.selected_item.bind("focus", this.activate_action)
                }
              }
            }
            ;
            h.prototype.container_mousedown = function(i) {
              var j;
              if (!this.is_disabled) {
                j = i != null ? (e(i.target)).hasClass("search-choice-close") : false;
                if (i && i.type === "mousedown") {
                  i.stopPropagation()
                }
                if (!this.pending_destroy_click && !j) {
                  if (!this.active_field) {
                    if (this.is_multiple) {
                      this.search_field.val("")
                    }
                    e(document).click(this.click_test_action);
                    this.results_show()
                  } else {
                    if (!this.is_multiple && i && ((e(i.target)[0] === this.selected_item[0]) || e(i.target).parents("a.chzn-single").length)) {
                      i.preventDefault();
                      this.results_toggle()
                    }
                  }
                  return this.activate_field()
                } else {
                  return this.pending_destroy_click = false
                }
              }
            }
            ;
            h.prototype.container_mouseup = function(i) {
              if (i.target.nodeName === "ABBR") {
                return this.results_reset(i)
              }
            }
            ;
            h.prototype.blur_test = function(i) {
              if (!this.active_field && this.container.hasClass("chzn-container-active")) {
                return this.close_field()
              }
            }
            ;
            h.prototype.close_field = function() {
              e(document).unbind("click", this.click_test_action);
              if (!this.is_multiple) {
                this.selected_item.attr("tabindex", this.search_field.attr("tabindex"));
                this.search_field.attr("tabindex", -1)
              }
              this.active_field = false;
              this.results_hide();
              this.container.removeClass("chzn-container-active");
              this.winnow_results_clear();
              this.clear_backstroke();
              this.show_search_field_default();
              return this.search_field_scale()
            }
            ;
            h.prototype.activate_field = function() {
              if (!this.is_multiple && !this.active_field) {
                this.search_field.attr("tabindex", this.selected_item.attr("tabindex"));
                this.selected_item.attr("tabindex", -1)
              }
              this.container.addClass("chzn-container-active");
              this.active_field = true;
              this.search_field.val(this.search_field.val());
              return this.search_field.focus()
            }
            ;
            h.prototype.test_active_click = function(i) {
              if (e(i.target).parents("#" + this.container_id).length) {
                return this.active_field = true
              } else {
                return this.close_field()
              }
            }
            ;
            h.prototype.results_build = function() {
              var j, m, l, i, k;
              this.parsing = true;
              this.results_data = a.SelectParser.select_to_array(this.form_field);
              if (this.is_multiple && this.choices > 0) {
                this.search_choices.find("li.search-choice").remove();
                this.choices = 0
              } else {
                if (!this.is_multiple) {
                  this.selected_item.find("span").text(this.default_text);
                  if (this.form_field.options.length <= this.disable_search_threshold) {
                    this.container.addClass("chzn-container-single-nosearch")
                  } else {
                    this.container.removeClass("chzn-container-single-nosearch")
                  }
                }
              }
              j = "";
              k = this.results_data;
              for (l = 0,
                  i = k.length; l < i; l++) {
                m = k[l];
                if (m.group) {
                  j += this.result_add_group(m)
                } else {
                  if (!m.empty) {
                    j += this.result_add_option(m);
                    if (m.selected && this.is_multiple) {
                      this.choice_build(m)
                    } else {
                      if (m.selected && !this.is_multiple) {
                        this.selected_item.find("span").text(m.text);
                        if (this.allow_single_deselect) {
                          this.single_deselect_control_build()
                        }
                      }
                    }
                  }
                }
              }
              this.search_field_disabled();
              this.show_search_field_default();
              this.search_field_scale();
              this.search_results.html(j);
              return this.parsing = false
            }
            ;
            h.prototype.result_add_group = function(i) {
              if (!i.disabled) {
                i.dom_id = this.container_id + "_g_" + i.array_index;
                return '<li id="' + i.dom_id + '" class="group-result">' + e("<div />").text(i.label).html() + "</li>"
              } else {
                return ""
              }
            }
            ;
            h.prototype.result_do_highlight = function(j) {
              var n, m, k, l, i;
              if (j.length) {
                this.result_clear_highlight();
                this.result_highlight = j;
                this.result_highlight.addClass("highlighted");
                k = parseInt(this.search_results.css("maxHeight"), 10);
                i = this.search_results.scrollTop();
                l = k + i;
                m = this.result_highlight.position().top + this.search_results.scrollTop();
                n = m + this.result_highlight.outerHeight();
                if (n >= l) {
                  return this.search_results.scrollTop((n - k) > 0 ? n - k : 0)
                } else {
                  if (m < i) {
                    return this.search_results.scrollTop(m)
                  }
                }
              }
            }
            ;
            h.prototype.result_clear_highlight = function() {
              if (this.result_highlight) {
                this.result_highlight.removeClass("highlighted")
              }
              return this.result_highlight = null
            }
            ;
            h.prototype.results_show = function() {
              var i;
              if (!this.is_multiple) {
                this.selected_item.addClass("chzn-single-with-drop");
                if (this.result_single_selected) {
                  this.result_do_highlight(this.result_single_selected)
                }
              }
              i = this.is_multiple ? this.container.height() : this.container.height() - 1;
              this.dropdown.css({
                top: i + "px",
                left: 0
              });
              this.results_showing = true;
              this.search_field.focus();
              this.search_field.val(this.search_field.val());
              this.winnow_results();
              if (this.enable_select_all) {
                return this.select_all_toggle()
              }
            }
            ;
            h.prototype.results_hide = function() {
              if (!this.is_multiple) {
                this.selected_item.removeClass("chzn-single-with-drop")
              }
              this.result_clear_highlight();
              this.dropdown.css({
                left: "-9000px"
              });
              return this.results_showing = false
            }
            ;
            h.prototype.select_all_setup = function() {
              var i, j = this;
              i = e("<a />", {
                "class": "chzn-select-all"
              }).html(this.Select_all_text_default);
              this.dropdown.append(i);
              this.select_all_link = this.dropdown.find(".chzn-select-all").first();
              return this.select_all_link.click(function(k) {
                return j.select_all_options(k)
              })
            }
            ;
            h.prototype.select_all_options = function(j) {
              var l, k, m, i;
              j.preventDefault();
              k = this.form_field_jq.find("option");
              for (m = 0,
                  i = k.length; m < i; m++) {
                l = k[m];
                if (!l.disabled) {
                  l.selected = true
                }
              }
              this.form_field_jq.trigger("liszt:updated");
              this.form_field_jq.trigger("liszt:selectall");
              this.select_all_disable();
              return this.results_hide()
            }
            ;
            h.prototype.select_all_disable = function() {
              return this.select_all_link.hide()
            }
            ;
            h.prototype.select_all_enable = function() {
              return this.select_all_link.show()
            }
            ;
            h.prototype.select_all_toggle = function() {
              var i;
              i = this.search_results.find("li.active-result");
              if (!i.length || this.search_field.val().length) {
                return this.select_all_disable()
              } else {
                return this.select_all_enable()
              }
            }
            ;
            h.prototype.set_tab_index = function(j) {
              var i;
              if (this.form_field_jq.attr("tabindex")) {
                i = this.form_field_jq.attr("tabindex");
                this.form_field_jq.attr("tabindex", -1);
                if (this.is_multiple) {
                  return this.search_field.attr("tabindex", i)
                } else {
                  this.selected_item.attr("tabindex", i);
                  return this.search_field.attr("tabindex", -1)
                }
              }
            }
            ;
            h.prototype.show_search_field_default = function() {
              if (this.is_multiple && this.choices < 1 && !this.active_field) {
                this.search_field.val(this.default_text);
                return this.search_field.addClass("default")
              } else {
                this.search_field.val("");
                return this.search_field.removeClass("default")
              }
            }
            ;
            h.prototype.search_results_mouseup = function(i) {
              var j;
              j = e(i.target).hasClass("active-result") ? e(i.target) : e(i.target).parents(".active-result").first();
              if (j.length) {
                this.result_highlight = j;
                return this.result_select(i)
              }
            }
            ;
            h.prototype.search_results_mouseover = function(i) {
              var j;
              j = e(i.target).hasClass("active-result") ? e(i.target) : e(i.target).parents(".active-result").first();
              if (j) {
                return this.result_do_highlight(j)
              }
            }
            ;
            h.prototype.search_results_mouseout = function(i) {
              if (e(i.target).hasClass("active-result" || e(i.target).parents(".active-result").first())) {
                return this.result_clear_highlight()
              }
            }
            ;
            h.prototype.choices_click = function(i) {
              i.preventDefault();
              if (this.active_field && !(e(i.target).hasClass("search-choice" || e(i.target).parents(".search-choice").first)) && !this.results_showing) {
                return this.results_show()
              }
            }
            ;
            h.prototype.choice_build = function(k) {
              var i, j, l = this;
              i = this.container_id + "_c_" + k.array_index;
              this.choices += 1;
              this.search_container.before('<li class="search-choice" id="' + i + '"><span>' + k.html + '</span><a href="javascript:void(0)" class="search-choice-close" rel="' + k.array_index + '"></a></li>');
              j = e("#" + i).find("a").first();
              return j.click(function(m) {
                return l.choice_destroy_link_click(m)
              })
            }
            ;
            h.prototype.choice_destroy_link_click = function(i) {
              i.preventDefault();
              if (!this.is_disabled) {
                this.pending_destroy_click = true;
                return this.choice_destroy(e(i.target))
              } else {
                return i.stopPropagation
              }
            }
            ;
            h.prototype.choice_destroy = function(i) {
              this.choices -= 1;
              this.show_search_field_default();
              if (this.is_multiple && this.choices > 0 && this.search_field.val().length < 1) {
                this.results_hide()
              }
              this.result_deselect(i.attr("rel"));
              return i.parents("li").first().remove()
            }
            ;
            h.prototype.results_reset = function(i) {
              this.form_field.options[0].selected = true;
              this.selected_item.find("span").text(this.default_text);
              this.show_search_field_default();
              e(i.target).remove();
              this.form_field_jq.trigger("change");
              if (this.active_field) {
                return this.results_hide()
              }
            }
            ;
            h.prototype.result_select = function(j) {
              var m, l, k, i;
              if (this.result_highlight) {
                m = this.result_highlight;
                l = m.attr("id");
                this.result_clear_highlight();
                if (this.is_multiple) {
                  this.result_deactivate(m)
                } else {
                  this.search_results.find(".result-selected").removeClass("result-selected");
                  this.result_single_selected = m
                }
                m.addClass("result-selected");
                i = l.substr(l.lastIndexOf("_") + 1);
                k = this.results_data[i];
                k.selected = true;
                this.form_field.options[k.options_index].selected = true;
                if (this.is_multiple) {
                  this.choice_build(k)
                } else {
                  this.selected_item.find("span").first().text(k.text);
                  if (this.allow_single_deselect) {
                    this.single_deselect_control_build()
                  }
                }
                if (!(j.metaKey && this.is_multiple)) {
                  this.results_hide()
                }
                this.search_field.val("");
                this.form_field_jq.trigger("change");
                return this.search_field_scale()
              }
            }
            ;
            h.prototype.result_activate = function(i) {
              return i.addClass("active-result")
            }
            ;
            h.prototype.result_deactivate = function(i) {
              return i.removeClass("active-result")
            }
            ;
            h.prototype.result_deselect = function(k) {
              var i, j;
              j = this.results_data[k];
              j.selected = false;
              this.form_field.options[j.options_index].selected = false;
              i = e("#" + this.container_id + "_o_" + k);
              i.removeClass("result-selected").addClass("active-result").show();
              this.result_clear_highlight();
              this.winnow_results();
              this.form_field_jq.trigger("change");
              return this.search_field_scale()
            }
            ;
            h.prototype.single_deselect_control_build = function() {
              if (this.allow_single_deselect && this.selected_item.find("abbr").length < 1) {
                return this.selected_item.find("span").first().after('<abbr class="search-choice-close"></abbr>')
              }
            }
            ;
            h.prototype.winnow_results = function() {
              var x, q, k, n, u, y, s, p, w, r, v, j, m, l, t, i, o;
              this.no_results_clear();
              p = 0;
              w = this.search_field.val() === this.default_text ? "" : e("<div/>").text(e.trim(this.search_field.val())).html();
              u = new RegExp("^" + w.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"),"i");
              j = new RegExp(w.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"),"i");
              o = this.results_data;
              for (m = 0,
                  t = o.length; m < t; m++) {
                q = o[m];
                if (!q.disabled && !q.empty) {
                  if (q.group) {
                    e("#" + q.dom_id).css("display", "none")
                  } else {
                    if (!(this.is_multiple && q.selected)) {
                      x = false;
                      s = q.dom_id;
                      y = e("#" + s);
                      if (u.test(q.html)) {
                        x = true;
                        p += 1
                      } else {
                        if (q.html.indexOf(" ") >= 0 || q.html.indexOf("[") === 0) {
                          n = q.html.replace(/\[|\]/g, "").split(" ");
                          if (n.length) {
                            for (l = 0,
                                i = n.length; l < i; l++) {
                              k = n[l];
                              if (u.test(k)) {
                                x = true;
                                p += 1
                              }
                            }
                          }
                        }
                      }
                      if (x) {
                        if (w.length) {
                          r = q.html.search(j);
                          v = q.html.substr(0, r + w.length) + "</em>" + q.html.substr(r + w.length);
                          v = v.substr(0, r) + "<em>" + v.substr(r)
                        } else {
                          v = q.html
                        }
                        y.html(v);
                        this.result_activate(y);
                        if (q.group_array_index != null) {
                          e("#" + this.results_data[q.group_array_index].dom_id).css("display", "list-item")
                        }
                      } else {
                        if (this.result_highlight && s === this.result_highlight.attr("id")) {
                          this.result_clear_highlight()
                        }
                        this.result_deactivate(y)
                      }
                    }
                  }
                }
              }
              if (p < 1 && w.length) {
                return this.no_results(w)
              } else {
                return this.winnow_results_set_highlight()
              }
            }
            ;
            h.prototype.winnow_results_clear = function() {
              var i, l, m, k, j;
              this.search_field.val("");
              l = this.search_results.find("li");
              j = [];
              for (m = 0,
                  k = l.length; m < k; m++) {
                i = l[m];
                i = e(i);
                if (i.hasClass("group-result")) {
                  j.push(i.css("display", "auto"))
                } else {
                  if (!this.is_multiple || !i.hasClass("result-selected")) {
                    j.push(this.result_activate(i))
                  } else {
                    j.push(void 0)
                  }
                }
              }
              return j
            }
            ;
            h.prototype.winnow_results_set_highlight = function() {
              var i, j;
              if (!this.result_highlight) {
                j = !this.is_multiple ? this.search_results.find(".result-selected.active-result") : [];
                i = j.length ? j.first() : this.search_results.find(".active-result").first();
                if (i != null) {
                  return this.result_do_highlight(i)
                }
              }
            }
            ;
            h.prototype.no_results = function(i) {
              var j;
              j = e('<li class="no-results">' + this.results_none_found + ' "<span></span>"</li>');
              j.find("span").first().html(i);
              return this.search_results.append(j)
            }
            ;
            h.prototype.no_results_clear = function() {
              return this.search_results.find(".no-results").remove()
            }
            ;
            h.prototype.keydown_arrow = function() {
              var j, i;
              if (!this.result_highlight) {
                j = this.search_results.find("li.active-result").first();
                if (j) {
                  this.result_do_highlight(e(j))
                }
              } else {
                if (this.results_showing) {
                  i = this.result_highlight.nextAll("li.active-result").first();
                  if (i) {
                    this.result_do_highlight(i)
                  }
                }
              }
              if (!this.results_showing) {
                return this.results_show()
              }
            }
            ;
            h.prototype.keyup_arrow = function() {
              var i;
              if (!this.results_showing && !this.is_multiple) {
                return this.results_show()
              } else {
                if (this.result_highlight) {
                  i = this.result_highlight.prevAll("li.active-result");
                  if (i.length) {
                    return this.result_do_highlight(i.first())
                  } else {
                    if (this.choices > 0) {
                      this.results_hide()
                    }
                    return this.result_clear_highlight()
                  }
                }
              }
            }
            ;
            h.prototype.keydown_backstroke = function() {
              if (this.pending_backstroke) {
                this.choice_destroy(this.pending_backstroke.find("a").first());
                return this.clear_backstroke()
              } else {
                this.pending_backstroke = this.search_container.siblings("li.search-choice").last();
                return this.pending_backstroke.addClass("search-choice-focus")
              }
            }
            ;
            h.prototype.clear_backstroke = function() {
              if (this.pending_backstroke) {
                this.pending_backstroke.removeClass("search-choice-focus")
              }
              return this.pending_backstroke = null
            }
            ;
            h.prototype.keydown_checker = function(i) {
              var k, j;
              k = (j = i.which) != null ? j : i.keyCode;
              this.search_field_scale();
              if (k !== 8 && this.pending_backstroke) {
                this.clear_backstroke()
              }
              switch (k) {
                case 8:
                  this.backstroke_length = this.search_field.val().length;
                  break;
                case 9:
                  if (this.results_showing && !this.is_multiple) {
                    this.result_select(i)
                  }
                  this.mouse_on_container = false;
                  break;
                case 13:
                  i.preventDefault();
                  break;
                case 38:
                  i.preventDefault();
                  this.keyup_arrow();
                  break;
                case 40:
                  this.keydown_arrow();
                  break
              }
            }
            ;
            h.prototype.search_field_scale = function() {
              var q, i, l, j, o, p, n, k, m;
              if (this.is_multiple) {
                l = 0;
                n = 0;
                o = "position:absolute; left: -1000px; top: -1000px; display:none;";
                p = ["font-size", "font-style", "font-weight", "font-family", "line-height", "text-transform", "letter-spacing"];
                for (k = 0,
                    m = p.length; k < m; k++) {
                  j = p[k];
                  o += j + ":" + this.search_field.css(j) + ";"
                }
                i = e("<div />", {
                  style: o
                });
                i.text(this.search_field.val());
                e("body").append(i);
                n = i.width() + 25;
                i.remove();
                if (n > this.f_width - 10) {
                  n = this.f_width - 10
                }
                this.search_field.css({
                  width: n + "px"
                });
                q = this.container.height();
                return this.dropdown.css({
                  top: q + "px"
                })
              }
            }
            ;
            h.prototype.generate_random_id = function() {
              var i;
              i = "sel" + this.generate_random_char() + this.generate_random_char() + this.generate_random_char();
              while (e("#" + i).length > 0) {
                i += this.generate_random_char()
              }
              return i
            }
            ;
            return h
          }
      )(AbstractChosen);
      d = function(g) {
        var h;
        return h = g.outerWidth() - g.width()
      }
      ;
      a.get_side_border_padding = d
    }
).call(this);
