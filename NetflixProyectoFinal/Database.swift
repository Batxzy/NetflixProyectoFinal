//
//  Database.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 20/11/24.
//

import Foundation

//MOVIES TOP 10 DATABASE STRUCT*************************************************
struct MoviesTop {
    var posterImageVertical: String
    var posterImageHorizontal: String
    var titulo: String
    var generos: [String]
    var rating: Double
    var descripcion: String
    var VideoURl : String
}

var moviesTopUno:MoviesTop = MoviesTop(
    posterImageVertical: "ArcaneVertical",
    posterImageHorizontal: "ArcaneHorizontal",
    titulo: "Arcane",
    generos: ["animación", "acción", "fantasia"],
    rating: 4.9,
    descripcion: "Mientras la discordia separa las ciudades gemelas de Piltóver y Zaun, dos hermanas se enfrentan en una guerra feroz entre tecnologías mágicas y convicciones opuestas.",
    VideoURl: "")
    

var moviesTopDos:MoviesTop = MoviesTop(
    posterImageVertical: "PedroParamoVertical",
    posterImageHorizontal: "PedroParamoHorizontal",
    titulo: "Pedro Paramo",
    generos: ["Drama", "méxico", "realismo mágico", "sobrenatural"],
    rating: 4.4,
    descripcion: "Un hombre busca a su padre, Pedro Páramo, en un pueblo de almas perdidas condenado por la violencia y la furia de un amor frustrado. Basada en la novela cumbre de Juan Rulfo.",
    VideoURl: "")

var moviesTopTres:MoviesTop = MoviesTop(
    posterImageVertical: "AprenderaSoltarVertical",
    posterImageHorizontal: "AprenderASoltarHorizontal",
    titulo: "Aprender a soltar",
    generos: ["Drama", "Suecia"],
    rating: 3.2,
    descripcion: "Una madre agotada hace un esfuerzo desesperado por mantener unida a su familia llevándose a todos de viaje a la competencia de pole dance de su hija adolescente.",
    VideoURl: "")

var moviesTopCuatro:MoviesTop = MoviesTop(
    posterImageVertical: "ConrteenElTiempoVertical",
    posterImageHorizontal: "CorteEnElTiempoHorizontal",
    titulo: "Corte en el tiempo",
    generos: ["Terror", "Cine sci-fi", "adolescentes"],
    rating: 1.8,
    descripcion: "Una chica viaja por accidente del año 2024 al 2003, solo unos días antes del asesinato de su hermana. ¿Podrá cambiar el pasado sin destruir el futuro?",
    VideoURl: "")

var moviesTopCinco:MoviesTop = MoviesTop(
    posterImageVertical: "LaproximaNavidadVertical",
    posterImageHorizontal: "laProximaNavidadHorizontal-1",
    titulo: "La proxima navidad",
    generos: ["Romance", "comedia"],
    rating: 4.6,
    descripcion: "En una misión para reencontrarse con el hombre de sus sueños, Layla recorre Nueva York buscando una milagrosa entrada para el concierto de Nochebuena de Pentatonix.",
    VideoURl: "")

var moviesTopSeis:MoviesTop = MoviesTop(
    posterImageVertical: "AngrybirdsVertical",
    posterImageHorizontal: "AngryBirdsHorizontal",
    titulo: "Angry Birds 2",
    generos: ["Infantil", "animación", "comedia"],
    rating: 3.4,
    descripcion: "Los enemigos se unen cuando los cerdos le proponen una tregua a las aves para unirse contra un nuevo y terrible rival que los amenaza a todos.",
    VideoURl: "")

var moviesTopSiete:MoviesTop = MoviesTop(
    posterImageVertical: "NoteMuevasVertical",
    posterImageHorizontal: "NoteMuevasHorizontal",
    titulo: "No te muevas",
    generos: ["intriga", "sombrío", "supervivencia"],
    rating: 1.9,
    descripcion: "Una mujer en duelo encuentra a un asesino que le inyecta una poderosa droga que la deja paralizada. Cuando su cuerpo deja de responder, su lucha por sobrevivir empieza.",
    VideoURl: "")

var moviesTopOcho:MoviesTop = MoviesTop(
    posterImageVertical: "Scream6Vertical",
    posterImageHorizontal: "Scream6Horizontal",
    titulo: "Scream 6: Grita",
    generos: ["terror", "suspenso", "juego psicológico"],
    rating: 3.4,
    descripcion: "Los sobrevivientes de los asesinatos de Woodsboro se mudan a NY para comenzar de nuevo, pero deben revivir su pesadilla cuando Ghostface reaparece para atormentarlos.",
    VideoURl: "")

var moviesTopNueve:MoviesTop = MoviesTop(
    posterImageVertical: "VenomVertical",
    posterImageHorizontal: "VenomHorizontal",
    titulo: "Venom: Carnage liberado",
    generos: ["Cine de sci-fi", "acción"],
    rating: 4.1,
    descripcion: "Mientras Eddie Brock y Venom intentan lidiar con su compleja relación, el asesino en serie Cletus Kasady y un nuevo simbionte alienígena se convierten en una inminente amenaza.",
    VideoURl: "")

var moviesTopDiez:MoviesTop = MoviesTop(
    posterImageVertical: "RamboVertical",
    posterImageHorizontal: "RamboHorizontal",
    titulo: "Rambo: Primera sangre",
    generos: ["militares", "acción"],
    rating: 4.7,
    descripcion: "Cuando se convierte en blanco del alguacil de un pueblito, el exmilitar y veterano de Vietnam John Rambo llega a su punto límite y lanza una respuesta guerrillera.",
    VideoURl: "")
//Example Instancia    moviesTopUno.descripcion
//***************************************************************************

//MOVIES DATABASE STRUCT********************************************************************
struct MoviesMovies {
    var posterImageVertical: String
    var posterImageHorizontal: String
    var titulo: String
    var generos: [String]
    var rating: Double
    var descripcion: String
    var videoUrl : String
}

var moviesUno:MoviesMovies = MoviesMovies(
    posterImageVertical: "whiplashVertical",
    posterImageHorizontal: "whiplashHorizontal",
    titulo: "Whiplash: Música y obsesión",
    generos: ["Drama", "música", "cine independiente"],
    rating: 4.5,
    descripcion: "Impulsado por su exigente maestro de música, el baterista Andrew está decidido a convertirse en una estrella de jazz, aunque destruya su personalidad.",
    videoUrl: "")

var moviesDos:MoviesMovies = MoviesMovies(
    posterImageVertical: "LalalandVertical",
    posterImageHorizontal: "LalaLandHorizontal",
    titulo: "La la land: Una historia de amor",
    generos: ["romance", "drama", "musical"],
    rating: 4.7,
    descripcion: "Este musical explora la alegría y el dolor de perseguir los sueños por medio de la historia de Mia, una aspirante a actriz, y Sebastian, un músico de jazz, quienes luchan por sobrevivir en Los Ángeles, una ciudad conocida por aplastar las esperanzas.",videoUrl: "")

var moviesTres:MoviesMovies = MoviesMovies(
    posterImageVertical: "InterstellarVertical",
    posterImageHorizontal: "interstellarHorizontal",
    titulo: "Interstellar",
    generos: ["drama", "fantasia", "ciencia ficción"],
    rating: 4.9,
    descripcion: "Un equipo de exploradores viaja más allá de esta galaxia a través de un recién descubierto agujero para descubrir si la humanidad tiene un futuro.",videoUrl: "")

var moviesCuatro:MoviesMovies = MoviesMovies(
    posterImageVertical: "SpidermanVertical",
    posterImageHorizontal: "spidermanHorizontal",
    titulo: "Spiderman: Into the spider-verse",
    generos: ["animación", "acción", "Inspiradora"],
    rating: 4.8,
    descripcion: "Spider-Man: Un Nuevo Universo presenta a Miles Morales, un adolescente de Brooklyn, y a las ilimitadas posibilidades del nuevo universo de Spider-Man, donde más de uno puede llevar máscara.", videoUrl: "")

var moviesCinco:MoviesMovies = MoviesMovies(
    posterImageVertical: "VozSilenciosaVertical",
    posterImageHorizontal: "vozSilenciosaHorizontal",
    titulo: "Una voz silenciosa",
    generos: ["animación", "drama", "emotiva"],
    rating: 4.9,
    descripcion: "Shoya Ishida es un estudiante de primaria problemático cuya principal misión en la vida es encontrar las formas menos apropiadas de combatir el aburrimiento. Es por eso que cuando Shoko Nishimiya, una niña sorda, es trasladada a su clase se convierte inmediatamente en blanco de sus burlas. Su acoso llega hasta tal punto que el resto de la clase acaba dándole la espalda por su falta de compasión.",videoUrl: "")
//*****************************************************************************+***********

//SERIES DATABASE STRUCT*******************************************************************
struct SeriesSeries {
    var posterImageVertical: String
    var posterImageHorizontal: String
    var titulo: String
    var generos: [String]
    var rating: Double
    var descripcion: String
    var VideoUrl: String
}

var seriesUno:SeriesSeries = SeriesSeries(
    posterImageVertical: "CyberpunkVertical",
    posterImageHorizontal: "CyberpunkHorizontal",
    titulo: "Cyberpunk edgerunners",
    generos: ["animes de sci-fi y fantasía", "acción", "videojuegos"],
    rating: 4.8,
    descripcion: "En una realidad distópica repleta de corrupción e implantes cibernéticos, un joven talentoso e impulsivo intenta convertirse en un mercenario.",VideoUrl: "")

var seriesDos:SeriesSeries = SeriesSeries(
    posterImageVertical: "SecretodelRioVertical",
    posterImageHorizontal: "SecretdelRioHorizontal",
    titulo: "El secreto del río",
    generos: ["drama", "LGBTQ+", "méxico", "temas sociales"],
    rating: 4.7,
    descripcion: "Cuando un chico llega a un pequeño pueblo mexicano, una profunda amistad florece con un niño local, y un oscuro secreto sella su vínculo para siempre.",VideoUrl: "")

var seriesTres:SeriesSeries = SeriesSeries(
    posterImageVertical: "StrangerThingsVertical",
    posterImageHorizontal: "strangerThingsHorizontal",
    titulo: "Stranger Things",
    generos: ["Terror", "drama", "series de sci-fi"],
    rating: 4.9,
    descripcion: "Después de la extraña desaparición de un niño, un pueblo se encuentra ante un misterio que revela experimentos secretos, fuerzas sobrenaturales y a una niña muy especial.",VideoUrl: "")

var seriesCuatro:SeriesSeries = SeriesSeries(
    posterImageVertical: "TheUmbrellaacademyVertical",
    posterImageHorizontal: "umbrellaAcademyHorizontal",
    titulo: "The Umbrella Academy",
    generos: ["series de sci-fi", "acción", "comics"],
    rating: 4.9,
    descripcion: "Reunidos por la muerte de su padre, hermanos distanciados con poderes extraordinarios destapan secretos perturbadores... y una amenaza inminente contra la humanidad.",VideoUrl: "")

var seriesCinco:SeriesSeries = SeriesSeries(
    posterImageVertical: "DahmerVertical",
    posterImageHorizontal: "dahmerHorizontal",
    titulo: "DAHMER",
    generos: ["drama", "terror", "basado en hechos reales"],
    rating: 4.4,
    descripcion: "Por más de una década, 17 adolescentes y jóvenes fueron asesinados por el criminal convicto Jeffrey Dahmer. ¿Cómo evitó ser capturado durante tanto tiempo?",VideoUrl: "")
//*****************************************************************************+***********
