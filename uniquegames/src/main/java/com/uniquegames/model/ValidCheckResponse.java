package com.uniquegames.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ValidCheckResponse {

    private Boolean status;
    private String field;
    private String message;
}
