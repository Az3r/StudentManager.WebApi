const db = require('../db/db');

exports.getRoomId = (ClassId)=>{
	let sql = `select Class.RoomId from Class join Room on Class.RoomId = Room.RoomId where Class.ClassId = '${ClassId}'`;
	return db.load(sql);
} 
exports.singleSchedule = (sc) => {
	let sql = `select * from Schedule as s where s.SessionId = '${sc.SessionId}' and s.Semester = ${sc.Semester} and ${sc.AcademicYear} = s.AcademicYear and s.DayOfWeek = ${sc.DayOfWeek} and TeacherId = '${sc.TeacherId}' and ClassId = '${sc.ClassId}'`; 
	return db.load(sql);
}
exports.add = (sc) => {
	let sql = `insert into schedule(SessionId, SubjectId, TeacherId, ClassId, RoomId, Semester, AcademicYear, DayOfWeek) values(${sc.SessionId}, ${sc.SubjectId}, '${sc.TeacherId}', '${sc.ClassId}', '${sc.RoomId}', ${sc.Semester}, ${sc.AcademicYear}, ${sc.DayOfWeek});`
	return db.load(sql);
}
exports.update = (sc) => {
	let sql = `update schedule set ClassId = '${sc.ClassId}', SubjectId = ${sc.SubjectId} where SessionId = ${sc.SessionId} and Semester = ${sc.Semester} and AcademicYear = ${sc.AcademicYear} and DayOfWeek = ${sc.DayOfWeek} and TeacherId = '${sc.TeacherId}';`
	return db.load(sql);
}
exports.getScheduleFromClassId = (ClassId, Semester, AcademicYear)=>{
	let sql = `select Schedule.*, Subject.SubjectName, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName from Schedule join Subject on Subject.SubjectId = Schedule.SubjectId join PersonalInfo on Schedule.TeacherId = PersonalInfo.PersonalInfoId where Schedule.ClassId = '${ClassId}'`;
	if(Semester != null) sql = sql + ` and Schedule.Semester = ${Semester}`;
	if(AcademicYear != null) sql = sql + ` and Schedule.AcademicYear = ${AcademicYear}`;
	return db.load(sql);
}
exports.loadAllSchedule = (Semester, AcademicYear)=>{
	let sql = `select Schedule.*, Subject.SubjectName, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName from Schedule join Subject on Subject.SubjectId = Schedule.SubjectId join PersonalInfo on Schedule.TeacherId = PersonalInfo.PersonalInfoId where 1!=0`;
	if(Semester != null) sql = sql + ` and Schedule.Semester = ${Semester}`;
	if(AcademicYear != null) sql = sql + ` and Schedule.AcademicYear = ${AcademicYear}`;
	return db.load(sql);
}