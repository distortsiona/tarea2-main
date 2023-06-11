import prisma from '../prismaClient.js'

const getTop5Personajes = async (req, res) => {
    try {
      const topPersonajes = await prisma.personajes.findMany({
        take: 5, // Limitar a los primeros 5 registros
        orderBy: {
          fuerza: 'desc', // Ordenar por fuerza de forma descendente
        },
      });
      res.json(topPersonajes);
    } catch (error) {
      res.status(500).json({ error: 'Ocurrió un error al obtener el top de personajes.' });
    }
  }

const getPersonajeConMasKarts = async (req, res) => {
  try {
    const personajeConMasKarts = await prisma.personajes.findFirst({
      select: {
        id: true,
        nombre: true,
        personajekart: {
          select: {
            id: true
          },
          orderBy: {
            id: 'desc'
          },
          take: 1
        }
      },
      orderBy: {
        personajekart: {
          count: 'desc'
        }
      }
    });
  
    if (!personajeConMasKarts) {
      return res.status(404).json({ error: 'No se encontró ningún personaje con karts.' });
    }
  
    const cantidadKarts = personajeConMasKarts.personajekart.length;
  
    res.json({
      personaje: {
        nombre: personajeConMasKarts.nombre
      },
      cantidadKarts
    });
  } catch (error) {
    res.status(500).json({ error: 'Ocurrió un error al obtener el personaje con más karts.' });
  }
}


const getCantidadHabitantesPorReino = async (req, res) => {
  try {
    const { idR} = req.params;

    const habitantes = await prisma.personaje_habita_reino.count({
      where: {
        id_reino: parseInt(idR)
      }
    });

    res.json({
      habitantes
    });
  } catch (error) {
    res.status(500).json({ error: 'Ocurrió un error al obtener la cantidad de habitantes.' });
  }
}


const getGobernantes = async (req, res) => {
  try {
    const { id } = req.params;

    let gobernantes;

    if (id) {
      gobernantes = await prisma.personaje_habita_reino.findMany({
        where: {
          id_reino: parseInt(id),
          es_gobernante: true
        },
        select: {
          personaje: {
            select: {
              nombre: true
            }
          }
        }
      });
    } else {
      gobernantes = await prisma.personaje_habita_reino.findMany({
        where: {
          es_gobernante: true
        },
        select: {
          personaje: {
            select: {
              nombre: true
            }
          }
        }
      });
    }

    if (!gobernantes || gobernantes.length === 0) {
      return res.status(404).json({ error: 'No se encontraron gobernantes.' });
    }

    const nombresGobernantes = gobernantes.map(gobernante => gobernante.personaje.nombre);

    res.json({
      nombresGobernantes
    });
  } catch (error) {
    res.status(500).json({ error: 'Ocurrió un error al obtener los gobernantes.' });
  }
}


  const EPControllers = {
    getTop5Personajes,
    getPersonajeConMasKarts,
    getCantidadHabitantesPorReino,
    getGobernantes
  
}

export default EPControllers
