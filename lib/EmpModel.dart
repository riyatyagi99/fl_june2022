/// statusCode : 1
/// responseData : {"message":"Successfully Login","employeeProfile":{"acessToken":"dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc","accessToken":"dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc","employeeId":"62303917035bd245180d53e4","firstName":"Riya","middleName":"","lastName":"Tyagi","empId":"MOB-155","email":"riya.tyagi@mobcoder.com","personalEmail":"riya.tyagi@mobcoder.com","gender":2,"phone":"919716741100","dob":731120400000,"experienceYear":3,"experienceMonth":3,"doj":1456794000000,"education":[{"degree":2,"course":"","collegeName":"COER college","description":"Good student","startDate":1649269800000,"endDate":1649269800000,"grade":"","isDeleted":1,"_id":"624eccdb8213a26e8d8cfd15"},{"degree":3,"course":"","collegeName":"hgtf","description":"","startDate":null,"endDate":null,"grade":"","isDeleted":1,"_id":"6253d041957dcd1aeb70b92f"}],"qualification":[],"status":1,"profileImage":"https://hrm-mob-dev.s3.amazonaws.com/2022-05-16.png","isDelete":1,"aboutUs":""},"isAdmin":2,"isProjectManager":2,"isDeviceManager":2}
/// requestParams : {"email":"riya.tyagi@mobcoder.com","password":"alpha@123"}
/// time : "2022-06-28T10:31:10.790Z"

class EmpModel {
  EmpModel({
      int? statusCode, 
      ResponseData? responseData, 
      RequestParams? requestParams, 
      String? time,}){
    _statusCode = statusCode;
    _responseData = responseData;
    _requestParams = requestParams;
    _time = time;
}

  EmpModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _responseData = json['responseData'] != null ? ResponseData.fromJson(json['responseData']) : null;
    _requestParams = json['requestParams'] != null ? RequestParams.fromJson(json['requestParams']) : null;
    _time = json['time'];
  }
  int? _statusCode;
  ResponseData? _responseData;
  RequestParams? _requestParams;
  String? _time;
EmpModel copyWith({  int? statusCode,
  ResponseData? responseData,
  RequestParams? requestParams,
  String? time,
}) => EmpModel(  statusCode: statusCode ?? _statusCode,
  responseData: responseData ?? _responseData,
  requestParams: requestParams ?? _requestParams,
  time: time ?? _time,
);
  int? get statusCode => _statusCode;
  ResponseData? get responseData => _responseData;
  RequestParams? get requestParams => _requestParams;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    if (_responseData != null) {
      map['responseData'] = _responseData?.toJson();
    }
    if (_requestParams != null) {
      map['requestParams'] = _requestParams?.toJson();
    }
    map['time'] = _time;
    return map;
  }

}

/// email : "riya.tyagi@mobcoder.com"
/// password : "alpha@123"

class RequestParams {
  RequestParams({
      String? email, 
      String? password,}){
    _email = email;
    _password = password;
}

  RequestParams.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
  }
  String? _email;
  String? _password;
RequestParams copyWith({  String? email,
  String? password,
}) => RequestParams(  email: email ?? _email,
  password: password ?? _password,
);
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}

/// message : "Successfully Login"
/// employeeProfile : {"acessToken":"dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc","accessToken":"dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc","employeeId":"62303917035bd245180d53e4","firstName":"Riya","middleName":"","lastName":"Tyagi","empId":"MOB-155","email":"riya.tyagi@mobcoder.com","personalEmail":"riya.tyagi@mobcoder.com","gender":2,"phone":"919716741100","dob":731120400000,"experienceYear":3,"experienceMonth":3,"doj":1456794000000,"education":[{"degree":2,"course":"","collegeName":"COER college","description":"Good student","startDate":1649269800000,"endDate":1649269800000,"grade":"","isDeleted":1,"_id":"624eccdb8213a26e8d8cfd15"},{"degree":3,"course":"","collegeName":"hgtf","description":"","startDate":null,"endDate":null,"grade":"","isDeleted":1,"_id":"6253d041957dcd1aeb70b92f"}],"qualification":[],"status":1,"profileImage":"https://hrm-mob-dev.s3.amazonaws.com/2022-05-16.png","isDelete":1,"aboutUs":""}
/// isAdmin : 2
/// isProjectManager : 2
/// isDeviceManager : 2

class ResponseData {
  ResponseData({
      String? message, 
      EmployeeProfile? employeeProfile, 
      int? isAdmin, 
      int? isProjectManager, 
      int? isDeviceManager,}){
    _message = message;
    _employeeProfile = employeeProfile;
    _isAdmin = isAdmin;
    _isProjectManager = isProjectManager;
    _isDeviceManager = isDeviceManager;
}

  ResponseData.fromJson(dynamic json) {
    _message = json['message'];
    _employeeProfile = json['employeeProfile'] != null ? EmployeeProfile.fromJson(json['employeeProfile']) : null;
    _isAdmin = json['isAdmin'];
    _isProjectManager = json['isProjectManager'];
    _isDeviceManager = json['isDeviceManager'];
  }
  String? _message;
  EmployeeProfile? _employeeProfile;
  int? _isAdmin;
  int? _isProjectManager;
  int? _isDeviceManager;
ResponseData copyWith({  String? message,
  EmployeeProfile? employeeProfile,
  int? isAdmin,
  int? isProjectManager,
  int? isDeviceManager,
}) => ResponseData(  message: message ?? _message,
  employeeProfile: employeeProfile ?? _employeeProfile,
  isAdmin: isAdmin ?? _isAdmin,
  isProjectManager: isProjectManager ?? _isProjectManager,
  isDeviceManager: isDeviceManager ?? _isDeviceManager,
);
  String? get message => _message;
  EmployeeProfile? get employeeProfile => _employeeProfile;
  int? get isAdmin => _isAdmin;
  int? get isProjectManager => _isProjectManager;
  int? get isDeviceManager => _isDeviceManager;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_employeeProfile != null) {
      map['employeeProfile'] = _employeeProfile?.toJson();
    }
    map['isAdmin'] = _isAdmin;
    map['isProjectManager'] = _isProjectManager;
    map['isDeviceManager'] = _isDeviceManager;
    return map;
  }

}

/// acessToken : "dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc"
/// accessToken : "dY3gjaw4GePgnnt5GED0BrrlqMHCQo2UrLvaXXMI9aJGKE5uaiiQqSqZl4y13jyc"
/// employeeId : "62303917035bd245180d53e4"
/// firstName : "Riya"
/// middleName : ""
/// lastName : "Tyagi"
/// empId : "MOB-155"
/// email : "riya.tyagi@mobcoder.com"
/// personalEmail : "riya.tyagi@mobcoder.com"
/// gender : 2
/// phone : "919716741100"
/// dob : 731120400000
/// experienceYear : 3
/// experienceMonth : 3
/// doj : 1456794000000
/// education : [{"degree":2,"course":"","collegeName":"COER college","description":"Good student","startDate":1649269800000,"endDate":1649269800000,"grade":"","isDeleted":1,"_id":"624eccdb8213a26e8d8cfd15"},{"degree":3,"course":"","collegeName":"hgtf","description":"","startDate":null,"endDate":null,"grade":"","isDeleted":1,"_id":"6253d041957dcd1aeb70b92f"}]
/// qualification : []
/// status : 1
/// profileImage : "https://hrm-mob-dev.s3.amazonaws.com/2022-05-16.png"
/// isDelete : 1
/// aboutUs : ""

class EmployeeProfile {
  EmployeeProfile({
      String? acessToken, 
      String? accessToken, 
      String? employeeId, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? empId, 
      String? email, 
      String? personalEmail, 
      int? gender, 
      String? phone, 
      int? dob, 
      int? experienceYear, 
      int? experienceMonth, 
      int? doj, 
      List<Education>? education, 
   //   List<dynamic>? qualification,
      int? status, 
      String? profileImage, 
      int? isDelete, 
      String? aboutUs,}){
    _acessToken = acessToken;
    _accessToken = accessToken;
    _employeeId = employeeId;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _empId = empId;
    _email = email;
    _personalEmail = personalEmail;
    _gender = gender;
    _phone = phone;
    _dob = dob;
    _experienceYear = experienceYear;
    _experienceMonth = experienceMonth;
    _doj = doj;
    _education = education;
   // _qualification = qualification;
    _status = status;
    _profileImage = profileImage;
    _isDelete = isDelete;
    _aboutUs = aboutUs;
}

  EmployeeProfile.fromJson(dynamic json) {
    _acessToken = json['acessToken'];
    _accessToken = json['accessToken'];
    _employeeId = json['employeeId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _empId = json['empId'];
    _email = json['email'];
    _personalEmail = json['personalEmail'];
    _gender = json['gender'];
    _phone = json['phone'];
    _dob = json['dob'];
    _experienceYear = json['experienceYear'];
    _experienceMonth = json['experienceMonth'];
    _doj = json['doj'];
    if (json['education'] != null) {
      _education = [];
      json['education'].forEach((v) {
        _education?.add(Education.fromJson(v));
      });
    }
 /*   if (json['qualification'] != null) {
      _qualification = [];
      json['qualification'].forEach((v) {
        _qualification?.add(Dynamic.fromJson(v));
      });
    }*/
    _status = json['status'];
    _profileImage = json['profileImage'];
    _isDelete = json['isDelete'];
    _aboutUs = json['aboutUs'];
  }
  String? _acessToken;
  String? _accessToken;
  String? _employeeId;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _empId;
  String? _email;
  String? _personalEmail;
  int? _gender;
  String? _phone;
  int? _dob;
  int? _experienceYear;
  int? _experienceMonth;
  int? _doj;
  List<Education>? _education;
//  List<dynamic>? _qualification;
  int? _status;
  String? _profileImage;
  int? _isDelete;
  String? _aboutUs;
EmployeeProfile copyWith({  String? acessToken,
  String? accessToken,
  String? employeeId,
  String? firstName,
  String? middleName,
  String? lastName,
  String? empId,
  String? email,
  String? personalEmail,
  int? gender,
  String? phone,
  int? dob,
  int? experienceYear,
  int? experienceMonth,
  int? doj,
  List<Education>? education,
  List<dynamic>? qualification,
  int? status,
  String? profileImage,
  int? isDelete,
  String? aboutUs,
}) => EmployeeProfile(  acessToken: acessToken ?? _acessToken,
  accessToken: accessToken ?? _accessToken,
  employeeId: employeeId ?? _employeeId,
  firstName: firstName ?? _firstName,
  middleName: middleName ?? _middleName,
  lastName: lastName ?? _lastName,
  empId: empId ?? _empId,
  email: email ?? _email,
  personalEmail: personalEmail ?? _personalEmail,
  gender: gender ?? _gender,
  phone: phone ?? _phone,
  dob: dob ?? _dob,
  experienceYear: experienceYear ?? _experienceYear,
  experienceMonth: experienceMonth ?? _experienceMonth,
  doj: doj ?? _doj,
  education: education ?? _education,
  //qualification: qualification ?? _qualification,
  status: status ?? _status,
  profileImage: profileImage ?? _profileImage,
  isDelete: isDelete ?? _isDelete,
  aboutUs: aboutUs ?? _aboutUs,
);
  String? get acessToken => _acessToken;
  String? get accessToken => _accessToken;
  String? get employeeId => _employeeId;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get empId => _empId;
  String? get email => _email;
  String? get personalEmail => _personalEmail;
  int? get gender => _gender;
  String? get phone => _phone;
  int? get dob => _dob;
  int? get experienceYear => _experienceYear;
  int? get experienceMonth => _experienceMonth;
  int? get doj => _doj;
  List<Education>? get education => _education;
  //List<dynamic>? get qualification => _qualification;
  int? get status => _status;
  String? get profileImage => _profileImage;
  int? get isDelete => _isDelete;
  String? get aboutUs => _aboutUs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acessToken'] = _acessToken;
    map['accessToken'] = _accessToken;
    map['employeeId'] = _employeeId;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['empId'] = _empId;
    map['email'] = _email;
    map['personalEmail'] = _personalEmail;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['dob'] = _dob;
    map['experienceYear'] = _experienceYear;
    map['experienceMonth'] = _experienceMonth;
    map['doj'] = _doj;
    if (_education != null) {
      map['education'] = _education?.map((v) => v.toJson()).toList();
    }
   /* if (_qualification != null) {
      map['qualification'] = _qualification?.map((v) => v.toJson()).toList();
    }*/
    map['status'] = _status;
    map['profileImage'] = _profileImage;
    map['isDelete'] = _isDelete;
    map['aboutUs'] = _aboutUs;
    return map;
  }

}

/// degree : 2
/// course : ""
/// collegeName : "COER college"
/// description : "Good student"
/// startDate : 1649269800000
/// endDate : 1649269800000
/// grade : ""
/// isDeleted : 1
/// _id : "624eccdb8213a26e8d8cfd15"

class Education {
  Education({
      int? degree, 
      String? course, 
      String? collegeName, 
      String? description, 
      int? startDate, 
      int? endDate, 
      String? grade, 
      int? isDeleted, 
      String? id,}){
    _degree = degree;
    _course = course;
    _collegeName = collegeName;
    _description = description;
    _startDate = startDate;
    _endDate = endDate;
    _grade = grade;
    _isDeleted = isDeleted;
    _id = id;
}

  Education.fromJson(dynamic json) {
    _degree = json['degree'];
    _course = json['course'];
    _collegeName = json['collegeName'];
    _description = json['description'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _grade = json['grade'];
    _isDeleted = json['isDeleted'];
    _id = json['_id'];
  }
  int? _degree;
  String? _course;
  String? _collegeName;
  String? _description;
  int? _startDate;
  int? _endDate;
  String? _grade;
  int? _isDeleted;
  String? _id;
Education copyWith({  int? degree,
  String? course,
  String? collegeName,
  String? description,
  int? startDate,
  int? endDate,
  String? grade,
  int? isDeleted,
  String? id,
}) => Education(  degree: degree ?? _degree,
  course: course ?? _course,
  collegeName: collegeName ?? _collegeName,
  description: description ?? _description,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  grade: grade ?? _grade,
  isDeleted: isDeleted ?? _isDeleted,
  id: id ?? _id,
);
  int? get degree => _degree;
  String? get course => _course;
  String? get collegeName => _collegeName;
  String? get description => _description;
  int? get startDate => _startDate;
  int? get endDate => _endDate;
  String? get grade => _grade;
  int? get isDeleted => _isDeleted;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['degree'] = _degree;
    map['course'] = _course;
    map['collegeName'] = _collegeName;
    map['description'] = _description;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['grade'] = _grade;
    map['isDeleted'] = _isDeleted;
    map['_id'] = _id;
    return map;
  }

}