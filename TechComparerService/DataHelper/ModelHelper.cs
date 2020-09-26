using TechnologyComparerService.Models;
using TechnologyComparerService.DataAccess;
using System.Data;
using System;
using System.Text.Json.Serialization;
using System.Collections.Generic;

namespace TechnologyComparerService.DataHelper
{
    public class ModelHelper
    {
        FactorSectorValue factorSectorValue = new FactorSectorValue();
        public List<Factor> fillFactorsModel()
        {
            List<Factor> factors = new List<Factor>();
            try
            {
                DataAccessClass data = new DataAccessClass();
                var result = data.getFactors();
                foreach (DataRow row in result.Tables[0].Rows)
                {
                    Factor newFactor = new Factor();
                    newFactor.FactorID = (int)row["FactorID"];
                    newFactor.FactorDescription = (string)row["FactorDescription"];
                    factors.Add(newFactor);                        
                }
                return factors;
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error fillFactorsModel(): " + ex.Message);
                return null;
            }
        }

        public List<Sector> fillSectorsModel()
        {
            List<Sector> sectors = new List<Sector>();
            try
            {
                DataAccessClass data = new DataAccessClass();
                var result = data.getSectors();
                foreach (DataRow row in result.Tables[0].Rows)
                {
                    Sector newSector = new Sector();
                    newSector.SectorID = (int)row["SectorID"];
                    newSector.SectorDescription = (string)row["SectorDescription"];
                    sectors.Add(newSector);
                }
                return sectors;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fillSectorsModel(): " + ex.Message);
                return null;
            }
        }

        public List<Value> fillValuesModel()
        {
            List<Value> values = new List<Value>();
            try
            {
                DataAccessClass data = new DataAccessClass();
                var result = data.getValues();
                foreach (DataRow row in result.Tables[0].Rows)
                {
                    Value newValue = new Value();
                    newValue.ValueID = (int)row["ValueID"];
                    newValue.ValueDescription = (string)row["ValueDescription"];
                    values.Add(newValue);
                }
                return values;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fillValuesModel(): " + ex.Message);
                return null;
            }
        }

        public FactorSectorValue fillFactorSectorValueModel()
        {
            factorSectorValue.factorList = fillFactorsModel();
            factorSectorValue.sectorList = fillSectorsModel();
            factorSectorValue.valueList = fillValuesModel();

            return factorSectorValue;
        }
    }
}