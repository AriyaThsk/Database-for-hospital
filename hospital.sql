create database dbhospital;

create table Appointment(
	app_id int primary key,
    date varchar(20)
);

create table appdate(
	app_id int,
    patient_id int,
    primary key(app_id,patient_id),
    foreign key(app_id) references Appointment(app_id),
    foreign key(patient_id) references Patient(patient_id)
);

create table doctor(
	doctor_id int primary key,
    doctor_name varchar(25) not null,
	section varchar(25) not null
);

create table pills(
	pills_id int primary key auto_increment,
    pills_name varchar(80) not null
);

create table symptoms(
	symptoms_id int primary key auto_increment,
    symp_name varchar(25) not null
);

create table disease(
	disease_id int primary key auto_increment,
    disease_name varchar(25) not null
);


create table nurse(
	nurse_id int primary key,
    nurse_name varchar(25) not null,
    section varchar(25) not null
);

create table patient(
	patient_id int primary key,
    fullname_p varchar(60) not null,
    app_date varchar(15),
    height float  check(height >= 15 and height <= 280),
    weight float  check(weight >= 15 and weight <= 300),
    heart_rate int  check(heart_rate >=50 and heart_rate <= 150),
    blood_pressure varchar(10) not null
);

create table pandp(
	pills_id int,
    patient_id int,
    primary key(patient_id,pills_id),
    foreign key(patient_id) references patient(patient_id),
	foreign key(pills_id) references pills(pills_id)
);


create table sandp(
    symptoms_id int,
    patient_id int,
    primary key(symptoms_id,patient_id),
    foreign key(symptoms_id) references symptoms(symptoms_id),
    foreign key(patient_id) references patient(patient_id)
);

create table sandd(
    symptoms_id int,
    disease_id int,
    primary key(symptoms_id,disease_id),
    foreign key(symptoms_id) references symptoms(symptoms_id),
    foreign key(disease_id) references disease(disease_id)
);

create table take(
    patient_id int,
    doctor_id int,
    primary key(patient_id,doctor_id),
    foreign key(patient_id) references patient(patient_id),
    foreign key(doctor_id) references doctor(doctor_id)
);

create table pandn(
    patient_id int,
    nurse_id int,
    primary key(patient_id,nurse_id),
    foreign key(nurse_id) references nurse(nurse_id),
	foreign key(patient_id) references patient(patient_id)
);
create table assist(
	doctor_id int,
	nurse_id int,
	primary key(doctor_id,nurse_id),
    foreign key(nurse_id) references nurse(nurse_id),
	foreign key(doctor_id) references doctor(doctor_id)
);

create table have(
	patient_id int,
    disease_id int,
    primary key(patient_id,disease_id),
    foreign key(disease_id) references disease(disease_id),
	foreign key(patient_id) references patient(patient_id)
);



insert into patient 
(patient_id,fullname_p,height,weight,heart_rate,blood_pressure)
	values(1,"Alice Bob",180,55,100,"120/80"),
	  (2,"YN TH",180,60,105,"125/92"),
      	  (3,"Best Alpha",190,55.5,98,"130/85");


insert into nurse
	(nurse_id,nurse_name,section)
	values(1,"Mark Su","Surgical Department"),
		  (2,"Elon Mu","Emergency Room"),
		  (3,"Bill Ga","Surgical Department");


insert into doctor
	(doctor_id,doctor_name,section)
	values(1,"Su Mark","Surgical Department"),
		  (2,"Mu Elon","Emergency Room"),
		  (3,"Ga Bill","Psychology Department");


insert into pills
	(pills_id,pills_name)
	values(1,"ethynodiol"),
		  (2,"ethinyl estradiol"),
		  (3,"levonorgestrel"),
         	  (4,"ethinyl estradiol");


insert into symptoms
	(symptoms_id,symp_name)
	values  (1,"Cough"),
		  (2,"Fewer"),
		  (3,"blurred vision"),
         	  (4,"flu");


insert into disease
	(disease_id,disease_name)
	values (1,"Localized Infection"),
		 (2,"Pulmonary Infection"),
		 (3,"Bloodstream Infection"),
         	 (4,"Disseminated Infection");


insert into assist
	(doctor_id,nurse_id)
	values(1,3),
		 (2,1);
          
 insert into take
	(patient_id,doctor_id)
	values(1,3),
		(1,2),
          	(2,2),
          	(3,2); 
      
insert into pandn
	(patient_id,nurse_id)
	values (1,1),
		  (2,1),
		  (3,1);

insert into Appointment
	(app_id,date)
	values(1,"09/11/2021"),
		(2,"15/12/2011");

insert into have
	(patient_id,disease_id)
	values(1,2),
		(1,3),
(2,4),
(3,4);

insert into appdate
	(app_id,patient_id)
	values(1,2),
		 (2,2);

insert into pandp
	(pills_id,patient_id)
	values(1,2),
	  	(1,3),
          	(2,1),
         	(3,2),
          	(2,3);

insert into sandd
	(symptoms_id,disease_id)
	values(1,2),
		 (2,1),
          	 (2,2),
          	 (2,3),
          	 (3,3);

insert into sandp
	(symptoms_id,patient_id)
	values(1,2),
		(1,3),
		(2,2),
		(3,3);
 
#Doctor and patient
SELECT doctor_name,fullname_p
FROM take
INNER JOIN doctor ON take.doctor_id=doctor.doctor_id
inner join patient ON take.patient_id=patient.patient_id;


#Patient and pills name
SELECT fullname_p,pills_name
FROM pandp
inner JOIN patient ON pandp.patient_id=patient.patient_id
inner join pills ON pandp.pills_id=pills.pills_id;

#Patient and appointment date
SELECT fullname_p, date
FROM appdate
inner JOIN patient ON appdate.patient_id=patient.patient_id
inner join appointment ON appdate.app_id=appointment.app_id;


