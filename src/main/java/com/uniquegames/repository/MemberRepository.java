//package com.uniquegames.repository;
//
//import com.uniquegames.vo.MemberVo;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Optional;
//import org.springframework.stereotype.Repository;
//
//public class MemberRepository {
//    private Map<Integer, MemberVo> store = new HashMap<>();
//    private int sequence = 0;
//
//    public MemberVo save(MemberVo member){
//        member.setId(++sequence);
//        store.put(member.getId(), member);
//        return store.get(member.getId());
//    }
//
//    public MemberVo findById(Long findid){
//        return store.get(findid);
//    }
//
//    public Optional<MemberVo> findByEmail(String email){
//        //optional이어야 loginservice에서 filter사용 가능
//        return findAll().stream()
//                .filter(m -> m.getEmail().equals(email))
//                .findFirst();
//    }
//
//    public List<MemberVo> findAll(){
//        return new ArrayList<>(store.values());
//    }
//
//    public Optional<MemberVo> findByEmailAndName(String email, String name){
//        return findByEmail(email)
//                .filter(m -> m.getName().equals(name));
//    }
//}
