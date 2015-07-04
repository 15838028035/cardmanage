package com.lj.app.cardmanage.user.service;

import org.springframework.stereotype.Service;

import com.lj.app.cardmanage.base.service.BaseServiceImpl;

@Service("userService")
public class UserServiceImpl<User> extends BaseServiceImpl<User> implements UserService<User>{

}
