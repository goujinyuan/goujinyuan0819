#创建数据库
create database resume;
# 切换数据库
use resume;
# 创建表
# 用户
CREATE TABLE IF NOT EXISTS `user`  (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `username` varchar(30) not null default '' comment '用户名称',
    `password` varchar(30) not null default '' comment '密码',
    `nickname` varchar(30) not null default '' comment '昵称',
    `phone` varchar(30) not null default '' comment '电话',
    `email` varchar(30) not null default '' comment '邮箱',
    `createTime` datetime not null default current_timestamp,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

# 简历
CREATE TABLE IF NOT EXISTS `resume`  (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `userId` BIGINT UNSIGNED not null comment '用户id',
    `name` varchar(30) not null default '' comment '姓名',
    `phone` varchar(30) not null default '' comment '电话',
    `email` varchar(30) not null default '' comment '邮箱',
    `education` varchar(30) not null default '' comment '学历',
    `experience` varchar(255) not null default '' comment '工作经验',
    `content` text comment '简历内容',
    `createTime` datetime not null default current_timestamp,
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简历表';

# 职位
CREATE TABLE IF NOT EXISTS `job`  (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `title` varchar(50) not null default '' comment '职位名称',
    `company` varchar(50) not null default '' comment '公司名称',
    `description` varchar(500) not null default '' comment '职位描述',
    `salary` varchar(30) not null default '' comment '薪资',
    `location` varchar(30) not null default '' comment '工作地点',
    `createTime` datetime not null default current_timestamp,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='职位表';

# 投递记录
CREATE TABLE IF NOT EXISTS `application`  (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `userId` BIGINT UNSIGNED not null comment '用户id',
    `jobId` BIGINT UNSIGNED not null comment '职位id',
    `resumeId` BIGINT UNSIGNED not null comment '简历id',
    `status` varchar(20) not null default '待处理' comment '申请状态',
    `createTime` datetime not null default current_timestamp,
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`),
    KEY `idx_jobId` (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='投递记录表';

# 收藏
CREATE TABLE IF NOT EXISTS `favorite`  (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `userId` BIGINT UNSIGNED not null comment '用户id',
    `jobId` BIGINT UNSIGNED not null comment '职位id',
    `createTime` datetime not null default current_timestamp,
    PRIMARY KEY (`id`),
    KEY `idx_userId` (`userId`),
    KEY `idx_jobId` (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收藏表';
