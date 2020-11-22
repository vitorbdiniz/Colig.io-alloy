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

one sig coligio {
	user: one User
}

one sig User {
	profile: one Profile,
	classes: set Class
}

sig Class {
	teachers: one Teacher,
	periods: one Period,
   	disciplines: one Discipline,
   	institutions: one Institution,
    	students: set Student
}

sig Period {
	year: one Int,
	semester: one Int
}
sig Institution{
	nome: one String
}

-- Modulo usuario
one sig Profile {
	name: one String,
	email: one String,
	password: one String
}

sig Teacher{
	Profile,
	job = "professor"
}
sig Student{
	Profile,
	job = "aluno"
}

-- Modulo disciplina

sig Discipline{
	name: one String,
	semester: one String,
	workload: one Int,
	activities: set Activities
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



