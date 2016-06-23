//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class MasterDataBLL
    {
        public Data.Services.MasterDataDAL MasterDataDAL;

        public MasterDataBLL()
        {
            MasterDataDAL = new Data.Services.MasterDataDAL();
        }

        public bool Guardar(LARCA20_MasterData MasterData)
        {
            return MasterDataDAL.Guardar(MasterData);
        }

        public List<LARCA20_MasterData> Todos()
        {
            return MasterDataDAL.Todos();
        }

        public List<LARCA20_MasterData> TodosFiltro(string id, string dataIni, string data)
        {
            return MasterDataDAL.TodosFiltro(id, dataIni, data);
        }

        public LARCA20_MasterData Traer(long id)
        {
            return MasterDataDAL.Traer(id);
        }

        public LARCA20_MasterData TraerPorData(string data, string dataIni)
        {
            return MasterDataDAL.TraerPorData(data, dataIni);
        }

        public LARCA20_MasterData Traer(string data, int id)
        {
            return MasterDataDAL.Traer(data, id);
        }

        public LARCA20_MasterData Traer(string codigo, string ini)
        {
            return MasterDataDAL.Traer(codigo, ini);
        }

        public bool Eliminar(long id)
        {
            return MasterDataDAL.Eliminar(id);
        }

        public List<LARCA20_MasterData> TraerSoloData(string tx1)
        {
            List<LARCA20_MasterData> ListaCompleta = MasterDataDAL.TraerSoloData(tx1);
            List<LARCA20_MasterData> ListaReturn = new List<LARCA20_MasterData>();
            Dictionary<string, int> contador = new Dictionary<string, int>();
            foreach (LARCA20_MasterData ms in ListaCompleta)
            {
                if (!contador.ContainsKey(ms.DataFin))
                {
                    ListaReturn.Add(ms);
                    contador.Add(ms.DataFin, 1);
                }
            }
            return ListaReturn;
        }
    }
}
