import prisma from '../prismaClient.js'

const createPersonajeHabitaReino = async (req, res) => {
    const { id_personaje, id_reino, fecha_registro, es_gobernante } = req.body;
    try {
      const personajeHabitaReino = await prisma.personaje_habita_reino.create({
        data: {
          personaje: { connect: { id: id_personaje } },
          reino: { connect: { id: id_reino } },
          fecha_registro,
          es_gobernante,
        },
      });
      res.json(personajeHabitaReino);
    } catch (error) {
      res.status(500).json({ error: 'Ocurrió un error al crear la relación.' });
    }
  }

  const getPersonajeHabitaReino = async (req, res) => {
    const { id_personaje, id_reino } = req.params;
    try {
      const personajeHabitaReino = await prisma.personaje_habita_reino.findUnique({
        where: {
          id_personaje_id_reino: {
            id_personaje: parseInt(id_personaje),
            id_reino: parseInt(id_reino),
          },
        },
      });
      res.json(personajeHabitaReino);
    } catch (error) {
      res.status(500).json({ error: 'Ocurrió un error al obtener la relación.' });
    }
  }


  const getPersonajeHabitaReinoById = async (req, res) => {
    const { id_personaje, id_reino } = req.params;
    try {
      const personajeHabitaReino = await prisma.personaje_habita_reino.findUnique({
        where: {
          id_personaje_id_reino: {
            id_personaje: parseInt(id_personaje),
            id_reino: parseInt(id_reino),
          },
        },
      });
      res.json(personajeHabitaReino);
    } catch (error) {
      res.status(500).json({ error: 'Ocurrió un error al obtener la relación.' });
    }
  }


  const updatePersonajeHabitaReino = async (req, res) => {
    const { id_personaje, id_reino } = req.params;
    const { fecha_registro, es_gobernante } = req.body;
    try {
      const updatedPersonajeHabitaReino = await prisma.personaje_habita_reino.update({
        where: {
          id_personaje_id_reino: {
            id_personaje: parseInt(id_personaje),
            id_reino: parseInt(id_reino),
          },
        },
        data: {
          fecha_registro,
          es_gobernante,
        },
      });
      res.json(updatedPersonajeHabitaReino);
    } catch (error) {
      res
        .status(500)
        .json({ error: 'Ocurrió un error al actualizar la relación.' });
    }
  }

  const deletePersonajeHabitaReino = async (req, res) => {
    const { id_personaje, id_reino } = req.params;
    try {
      const deletedPersonajeHabitaReino = await prisma.personaje_habita_reino.delete({
        where: {
          id_personaje_id_reino: {
            id_personaje: parseInt(id_personaje),
            id_reino: parseInt(id_reino),
          },
        },
      });
      res.json(deletedPersonajeHabitaReino);
    } catch (error) {
      res
        .status(500)
        .json({ error: 'Ocurrió un error al eliminar la relación.' });
    }
  }

const PersonajeHabitaReinoController = {
    createPersonajeHabitaReino,
    getPersonajeHabitaReino,
    getPersonajeHabitaReinoById,
    updatePersonajeHabitaReino,
    deletePersonajeHabitaReino
}

export default PersonajeHabitaReinoController