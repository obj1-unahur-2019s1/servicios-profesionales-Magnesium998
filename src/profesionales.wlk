import universidad.*

class Profesionales {
	var universidad
	method universidad() = universidad 
	method universidad(univ) { universidad = univ }
} 


class ProfesionalAsociado inherits Profesionales {
	
	method provinciaDondePuedeTrabajar() =  #{"Entre Ríos", "Corrientes", "Santa Fe"}
	
	method honorariosPorHora() = 3000 
}


class ProfesionalVinculado inherits Profesionales {
		
	method provinciaDondePuedeTrabajar() = universidad.provincia()
	
	method honorariosPorHora() = universidad.honorarios()
}


class ProfesionalLibre inherits Profesionales {
	var property provincias = #{}
	var property honorariosPorHora
		
	method provinciaDondePuedeTrabajar(provincia) { provincias.add(provincia) }
	
	method honorariosPorHora() = honorariosPorHora
}