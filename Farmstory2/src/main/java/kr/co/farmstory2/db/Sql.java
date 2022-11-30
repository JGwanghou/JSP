package kr.co.farmstory2.db;

public class Sql {

	public static final String INSERT_USER = "INSERT INTO `board_user` SET "
											+ "`uid`=?, "
											+ "`pass`=SHA2(?, 256), "
											+ "`name`=?, "
											+ "`nick`=?, "
											+ "`email`=?, "
											+ "`hp`=?, "
											+ "`zip`=?, "
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
	public static final String INSERT_ARTICLE = "insert into `board_article` set "
												+ "`cate`=?,"
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	public static final String INSERT_FILE = "insert into `board_file` set "
												+ "`parent`=?,"
												+ "`newName`=?,"
												+ "`oriName`=?";
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article` WHERE `parent`=0 AND `cate`=?";
	
	public static final String SELECT_TERMS = "select * from `board_terms`";
	
	public static final String SELECT_ARTICLES = "SELECT * FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent` = 0 AND `cate`=? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?,10";
	public static final String SELECT_LATESTS = "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";
	
	public static final String SELECT_LATEST = "SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 3";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download "
												+ "FROM `board_article` AS a "
												+ "LEFT JOIN `board_file` AS b "
												+ "ON a.`no` = b.`parent` "
												+ "WHERE `no`=?";
												
	
	public static final String SELECT_COUNT_UID = "select count(`uid`) from `board_user` where `uid`=?";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	
	public static final String SELECT_USER = "select * from `board_user` where `uid`=? and `pass`=SHA2(?, 256)";
	
	public static final String UPDATE_ARTICLE = "UPDATE `board_article` SET `title`=?, `content`=? where `no`=?";
	
	public static final String DELETE_ARTICLE = "delete from `board_article` where `no`=?";
								
}
