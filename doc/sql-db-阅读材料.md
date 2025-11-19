---
type: basic-note
title: sql-db-阅读材料
author: JackyLee
create_time: 2024-12-08
update_time:
  - 2025-02-26
tags:
description:
---

## 介绍

- [join on多个条件的理解_sql join on 多个条件-CSDN博客](https://blog.csdn.net/weixin_44457814/article/details/106716384)
- [黎朝阳 - PostgreSQL 与 MySQL 相比，优势何在？ - 知乎](https://www.zhihu.com/question/20010554/answer/1938309828507313692)

  - 概要: 你可能遇到过这样的需求： 公司想实时看到一块区域的降雨分布，或者道路交通、空气质量等空间数据的变化。 数据不是静态的，而是源源不断地从传感器、接口或第三方 API 中推送进来。 更复杂的是，这些数据既要存下来方便分析，又要在 Web 地图上实时可视化出来，最好还能在 3D 场景里转一转。这时候，很多人的第一反应可能是： “找个现成的 GIS 平台呗。” 可真用起来才发现——要么功能不够定制化，要么价格不够友好，要么部署…
  - 点赞: 117

- [据说他姓 feng - 面试官灵魂拷问：为什么 SQL 语句不要过多的 join？ - 知乎](https://www.zhihu.com/question/585496172/answer/2997397469)
  - 概要: 有一个回答说得很对。。。 “面试官，你们没用过好用的数据库。你也不懂数据库。” 这不让那不让，动不动就大数据。。。动不动就照搬阿里巴巴的规范。。。 面试过几个互联网云原生原教旨主义者，张嘴闭嘴大数据，不管 3721 一律分库分表分布式。我问，你们表最大多少行？答曰 500w。500w 算个毛线大数据啊，连 HDD 的 MySQL 的性能蜕化点都够不着。 又譬如互联网人重视“效率”，说视图（view）每次查询效率很低，我问他怎么解决，他说…
  - 点赞: 4054
- [怎么实现一个简单的数据库系统？](https://www.zhihu.com/question/26802517/answer/1898314134744994702)
- [强哥叨逼叨 - 大家都是如何接触 PostgreSql 的 - 知乎](https://www.zhihu.com/question/1889038053630263641/answer/1933455744772055134)
  - 概要: 在处理 Postgres 数据库时，有一系列事情我发现它们让我的生活和同事的生活变得更加愉快。每件事本身都很小，但综合起来效果显著。 使用 UUID 作为主键 UUIDs 也有缺点 真正随机的 UUID 排序效果不好（这对索引也有影响）它们占用的空间比顺序 ID 更多（空间是你最便宜的资源）但我发现其缺点远远被优点所弥补 生成一个 UUID 时不需要与数据库进行协调。它们可以安全地对外共享。CREATE TABLE person( id uuid not null default g…
  - 点赞: 16


## 参考资料

- [PostgreSQL 17 发布：摊牌了，我不装了！ - 知乎](https://zhuanlan.zhihu.com/p/732758503)
- [SQLite 的读写效率很高，有哪些使用其他数据库的理由？ - 知乎](https://www.zhihu.com/question/31417262/answer/2864492789)
- [阿里面试：为什么 MySQL 不建议使用 delete 删除数据？ - 知乎](https://www.zhihu.com/question/586845366/answer/18764783323)
- [SQLite 的文艺复兴 - 知乎](https://zhuanlan.zhihu.com/p/601510076)
- [图解 MySql 原理 - 知乎](https://zhuanlan.zhihu.com/p/586535564)
- [请问您见过最惊艳的 sql 查询语句是什么？ - 知乎](https://www.zhihu.com/question/384673958/answer/3073350200)
- [postgresql 也很强大，为何在中国大陆，mysql 成为主流，postgresql 屈居二线呢？ - 知乎](https://www.zhihu.com/question/31955622/answer/17264194602)
- [MySQL 中添加唯一约束和联合唯一约束 - 星朝 - 博客园](https://www.cnblogs.com/jpfss/p/12190750.html)
- [SQL 执行顺序 - 掘金](https://juejin.cn/post/6850418117764628487)
- [构建最快的嵌入式数据库——ClickHouse on Everything - 知乎](https://zhuanlan.zhihu.com/p/714851543)
- [请问您见过最惊艳的 sql 查询语句是什么？](https://www.zhihu.com/question/384673958/answer/3074538715)

## 数据库项目以及简单介绍

### awesome-db

- [numetriclabz/awesome-db: A curated list of amazingly awesome database libraries, resources and shiny things by https://www.numetriclabz.com/](https://github.com/numetriclabz/awesome-db)

### mysql-server

- [mysql/mysql-server: MySQL Server, the world's most popular open source database, and MySQL Cluster, a real-time, open source transactional database.](https://github.com/mysql/mysql-server)

### sqlite

- [sqlite/sqlite: Official Git mirror of the SQLite source tree](https://github.com/sqlite/sqlite)

### redis

- [redis/redis: Redis is an in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.](https://github.com/redis/redis)

### leveldb

Goolge 的项目

- [google/leveldb: LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.](https://github.com/google/leveldb)

### elasticsearch

- [elastic/elasticsearch: Free and Open Source, Distributed, RESTful Search Engine](https://github.com/elastic/elasticsearch)

### 数据库 SimpleDB

- [dstibrany/SimpleDB: SimpleDB implementation for MIT 6.830](https://github.com/dstibrany/SimpleDB)

## 参考资料

- [angels - 不会写复杂的 SQL，该怎么学习？ - 知乎](https://www.zhihu.com/question/327369469/answer/3414157727)

  - 概要: 我教你怎么写，用二个表就可以写出让你灵魂出窍头皮发麻的 SQL。但是 SQL 写复杂不是目的，解决问题才是目的。 搞个业务需求，我杜撰一个吧。有客户表和客户订单表，我们要查出客户的信息并带上客户最后订单的订单重量。一个客户会有多个订单，只能出现最后一个订单的重量，其它的不要。 这需要二张表，客户表，客户订单表。我们看看以这二张表能写多复杂的查询。中间绝对不加任何表了。 先看表结构：表的主键我都用 GUID，外键使用…
  - 点赞: 185

- [廖雪峰 - 怎么实现一个简单的数据库系统？ - 知乎](https://www.zhihu.com/question/26802517/answer/1967294120377705186)

  - 概要: 现代数据库系统太复杂了，各个子系统加起来比操作系统还复杂，而且操作系统的复杂度是分散的，IO、内存分配、调度是基本分开的，数据库的存储、锁、事务、执行器都是紧密结合在一起的，所以要实现一个简单的数据库系统，最好还是确定几个最最基本的需求： 1.B+Tree 实现存储； 2.Atomic 事务支持； 3.CopyOnWrite 并发支持； 4.最简单的索引+查询（不做优化的那种） 不推荐啃 sqlite 更不推荐啃 postgres。 自己实现 demo 我推荐这本书： …
  - 点赞: 57