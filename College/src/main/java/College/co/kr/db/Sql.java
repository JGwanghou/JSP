package College.co.kr.db;

public class Sql {

	// insert
	public static final String INSERT_LECTURE = "INSERT INTO `LECTURE` VALUES (?, ?, ?, ?, ?)";
	
	public static final String INSERT_STUDENT = "INSERT INTO `STUDENT` VALUES (?, ?, ?, ?, ?)";
	
	// select
	public static final String SELECT_LECTURE = "SELECT * FROM `LECTURE`";
	
	public static final String SELECT_REGISTER = "SELECT `stdNo`, `stdName`, `lecName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade` FROM `lecture` AS a "
													+"JOIN `register` AS b "
													+"ON a.lecNo = b.regLecNo "
													+"JOIN student AS c ON b.regStdNo = c.stdNo";
										
	public static final String SELECT_STUDENT = "SELECT `STUDENT`";
	
	// update

}
