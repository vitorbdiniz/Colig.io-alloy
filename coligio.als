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
	classes: set Classes
}

one sig Profile {
	name: one Username,
	email: one Email,
	password: one Password
}

one sig Username {}
one sig Email {}
one sig Password {}

sig Class {
	teachers: one Teacher,
	periods: one Period,
    disciplines: one Discipline,
    institutions: one Institution,
    students: set Student
	
}

sig Teacher {}
sig Period {}
sig Discipline{}
sig Institution{}

sig Student {
	name: one StudentName,
	email: one StudentEmail
}

sig StudentName {}
sig StudentEmail{}

