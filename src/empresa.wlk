import profesionales.*
import universidad.*

class Empresa {
	
	const property empleados = []
	var property honorarioDeReferencia
	
	method contratarEmpleado(empleado) { empleados.add(empleado) }
	
	method cuantosEstudiaronEn(universidad) = empleados.count{ e => e.universidad() == universidad}
	
	method profesionalesCaros() = empleados.filter{ e => e.honorariosPorHora() > honorarioDeReferencia }
	
	method profesionalMasBarato() = empleados.min{ e => e.honorariosPorHora() }
	
	method universidadesFormadoras() = empleados.map{ e => e.universidad() }.asSet()
	
	method esDeGenteAcotada() = empleados.any{ e => e.provinciaDondePuedeTrabajar().size() > 3 }

}

class Solicitante {
	method puedeSerAtendidoPorUnProfesional(profesional)
}


class Personas inherits Solicitante {
	var provincia
	
	override method puedeSerAtendidoPorUnProfesional(profesional) = profesional.provinciaDondePuedeTrabajar()
																	.any{ p => p == provincia }
	
}

class Institucion inherits Solicitante {
	var property universidades
	
	 override method puedeSerAtendidoPorUnProfesional(profesional) = profesional.provinciasDondePuedeTrabajar()
	 																 .any{ p => self.puedeTrabajarEnProvincia(p)}
	 																 
	 method puedeTrabajarEnProvincia(provincia) = universidades.contains(provincia)
}
