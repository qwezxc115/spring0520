package com.choong.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choong.spr.domain.MemberDto;
import com.choong.spr.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입
	public boolean addMember(MemberDto member) {
		return mapper.insertMember(member) == 1;
	}

	// id 중복 체크
	public boolean hasMemberId(String id) {
		// TODO Auto-generated method stub
		return mapper.countMemberId(id) > 0;
	}

	// Email 중복 체크
	public boolean hasMemberEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.countMemberEmail(email) > 0;
	}

	public boolean hasMemberNickName(String nickName) {
		// TODO Auto-generated method stub
		return mapper.countMemberNickName(nickName) > 0;
	}
	
	public List<MemberDto> listMember() {

		return mapper.selectAllMember();
	}

	public MemberDto getMemberById(String id) {
		// TODO Auto-generated method stub
		return mapper.selectMemberById(id);
	}

	public boolean removeMember(MemberDto dto) {
		MemberDto member = mapper.selectMemberById(dto.getId());
		
		if (member.getPassword().equals(dto.getPassword())) {
			return mapper.deleteMemberById(dto.getId()) == 1;
		}
		
		return false;
	}

	public boolean modifyMember(MemberDto dto, String oldPassword) {
		// db에서 member 읽어서
		MemberDto oldMember = mapper.selectMemberById(dto.getId());
		
		// 기존 password가 일치 할 때만 계속 진행 
		if (oldMember.getPassword().equals(oldPassword)) {
			return mapper.updateMember(dto) == 1;
		}
		
		return false;
	}

	
}
