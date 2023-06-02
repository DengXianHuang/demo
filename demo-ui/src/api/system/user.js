import request from '@/utils/request'
import { parseStrEmpty } from "@/utils/ruoyi";

// 查询用户列表
export function listUser(query) {
  return request({
    url: '/findUserForPage',
    method: 'get',
    params: query
  })
}

// 查询用户详细
export function getUser(sysUserId) {
  return request({
    url: '/findByUserId/' + sysUserId,
    method: 'get'
  })
}

// 查询用户详细
export function getPostList() {
  return request({
    url: '/system/post/allList',
    method: 'get'
  })
}

// 新增用户
export function addUser(data) {
  return request({
    url: '/insertUser',
    method: 'post',
    data: data
  })
}

// 修改用户
export function updateUser(data) {
  return request({
    url: '/updateUserById',
    method: 'post',
    data: data
  })
}

// 删除用户
export function delUser(sysUserId) {
  return request({
    url: '/deleteUserById/' + sysUserId,
    method: 'get',
  })
}

// 用户密码重置
export function resetUserPwd(sysUserId, passWd) {
  const data = {
    sysUserId,
    passWd
  }
  return request({
    url: '/updateUserById',
    method: 'post',
    data: data
  })
}

// 用户状态修改
export function changeUserStatus(sysUserId, userStatus) {
  const data = {
    sysUserId,
    userStatus
  }
  return request({
    url: '/system/user/changeStatus',
    method: 'put',
    data: data
  })
}

// 查询用户个人信息
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 修改用户个人信息
export function updateUserProfile(data) {
  return request({
    url: '/system/user/profile',
    method: 'put',
    data: data
  })
}

// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data
  })
}

// 用户头像上传
export function uploadAvatar(data) {
  return request({
    url: '/system/user/profile/avatar',
    method: 'post',
    data: data
  })
}

// 查询授权角色
export function getAuthRole(userId) {
  return request({
    url: '/system/user/authRole/' + userId,
    method: 'get'
  })
}

// 保存授权角色
export function updateAuthRole(data) {
  return request({
    url: '/system/user/authRole',
    method: 'put',
    params: data
  })
}

// 查询部门下拉树结构
export function deptTreeSelect(data) {
  return request({
    url: '/findSysDeptTree',
    method: 'post',
    data: data
  })
}
