using DataAccess.DbAccess;
using FinderWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class PairData : IPairData
    {
        private readonly ISqlDataAccess _db;

        public PairData(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task InsertDecision(PairModel pair) =>
            _db.SaveData("SendDecision", pair);
    }
}
