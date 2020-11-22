-- Especificação Formal do Colig.io em Alloy

-- Equipe: 
-- Arthur Silva Lima Guedes
-- Bruno Roberto Silva de Siqueira
-- Dayvid Daniel da Silva
-- Danilo de Menezes Freitas
-- Felipe de Amorim Ferreira
-- Gabriel Fernandes da Costa
-- João Pedro Santa Cruz Sobral
-- João Pedro Santino Espíndula
-- Luis Eduardo Barroso Mafra
-- Talita Galdino Gouveia
-- Vitor Braga Diniz

module coligio

-- Assinaturas

one sig Coligio {
	disciplines: set Discipline,
	activities: set Activities,
	users: set Profile
}

-- Modulo disciplina
sig Discipline {
	name: one String,
	semester: one String,
	workload: one Int,
   	institutions: one String,

	teachers: one Teacher,
	activities: set Activities,
    	students: set Student
}

fact{
	all d:Discipline | some c:Coligio | d.teachers in c.users
	all d:Discipline | some c:Coligio | d.students in c.users
	all d:Discipline | some c:Coligio | d.activities in c.activities
	
}

-- Modulo usuario
sig Profile {
	name: one String,
	email: one String,
	password: one String,
	disciplines: set Discipline
}

sig Teacher extends Profile{
	job = "professor"
}
sig Student extends Profile{

	job = "aluno"
}

 //Fatos do usuario
fact{
	all p:Profile | all c:Coligio | p in c.users
	all p:Profile | all c:Coligio | p.disciplines in c.disciplines
	all p:Profile | "@" in p.email
	
}

-- Modulo atividade
sig Activities{
	name: one String,
	description: one String,
	deliverDate: one Date
}
sig Date{
	day: one Int,
	month: one Int,
	year: one Int
}

fact{
	all a:Activities | all c:Coligio | a in c.activities
	all a:Activities | some d:Discipline | a in d.activities
	all d:Date | d.day > 0 and d.day <= 31
	all d:Date | d.month > 0 and d.day <= 12
	all d:Date | d.year > 2020
}
