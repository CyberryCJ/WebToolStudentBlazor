using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using WebToolStudentBlazor.Models;

namespace WebToolStudentBlazor.Services
{
    public class StudentsServices
    {
        private IConfiguration _configuration;

        public StudentsServices(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        private string ConnectionString() => _configuration.GetSection("ConnectionStrings").GetSection("studentConstring").Value;
      

        public async Task<Students[]> StudentGetData()
        {
            var conString = ConnectionString();
            List<Students> lst = new List<Students>();

            using (var con = new MySqlConnection(conString))
            {
                try
                {
                    await con.OpenAsync();
                    var com = new MySqlCommand("SELECT `Id`,`FirstName`,`MI`,`LastName`,`Birthdate`,`Address`,`Email` FROM `tblstudinfo`", con)
                    {
                        CommandType = CommandType.Text
                    };

                    var rdr = (MySqlDataReader)await com.ExecuteReaderAsync();

                    while ( await rdr.ReadAsync())
                    {
                        lst.Add(new Students
                        {
                            id = (int) rdr["Id"],
                            fname = rdr["FirstName"].ToString(),
                            mi = rdr["MI"].ToString(),
                            lname = rdr["LastName"].ToString(),
                            bdate = Convert.ToDateTime(rdr["Birthdate"]),
                            address = rdr["Address"].ToString(),
                            email = rdr["Email"].ToString()
                        });
                    }

                }
                catch (Exception ex)
                {

                    throw;
                }
            }
            return lst.ToArray();

        }

        public async Task<int> AddStudent(Students student)
        {
            var connectionString = ConnectionString();
            int i = 0;

            using (var con = new MySqlConnection(connectionString))
            {
                var str = "Insert into tblstudinfo  (`FirstName`,`MI`,`LastName`,`Birthdate`,`Address`,`Email`) " +
                    $" VALUES (@fname,@mi,@lname,@bdate,@address,@email)";
                try
                {
                    await con.OpenAsync().ConfigureAwait(false);
                    var com = new MySqlCommand(str, con)
                    {
                        CommandType = CommandType.Text
                    };

                    com.Parameters.Clear();
                    com.Parameters.AddWithValue("@fname", student.fname);
                    com.Parameters.AddWithValue("@mi", student.mi);
                    com.Parameters.AddWithValue("@lname", student.lname);
                    com.Parameters.AddWithValue("@bdate", student.bdate);
                    com.Parameters.AddWithValue("@address", student.address);
                    com.Parameters.AddWithValue("@email", student.email);

                    i = await com.ExecuteNonQueryAsync().ConfigureAwait(false);
                }
                catch (Exception ex)
                {

                    //throw;
                }
                finally
                {
                    await con.CloseAsync().ConfigureAwait(false);
                }
            }
            return i;
        }

        public async Task<int> UpdateStudent(Students student)
        {
            var connectionString = ConnectionString();
            int i = 0;

            using (var con = new MySqlConnection(connectionString))
            {
                var str = "Update tblstudinfo SET `FirstName` = @fname,`MI` = @mi ,`LastName` = @lname,`Birthdate` = @bdate,`Address` = @address,`Email` =  @email" +
                    $" WHERE `id` = @id";
                try
                {
                    await con.OpenAsync().ConfigureAwait(false);
                    var com = new MySqlCommand(str, con)
                    {
                        CommandType = CommandType.Text
                    };

                    com.Parameters.Clear();
                    com.Parameters.AddWithValue("@id", student.id);
                    com.Parameters.AddWithValue("@fname", student.fname);
                    com.Parameters.AddWithValue("@mi", student.mi);
                    com.Parameters.AddWithValue("@lname", student.lname);
                    com.Parameters.AddWithValue("@bdate", student.bdate);
                    com.Parameters.AddWithValue("@address", student.address);
                    com.Parameters.AddWithValue("@email", student.email);

                    i = await com.ExecuteNonQueryAsync().ConfigureAwait(false);
                }
                catch (Exception ex)
                {

                    //throw;
                }
                finally
                {
                    await con.CloseAsync().ConfigureAwait(false);
                }
            }
            return i;
        }

        public async Task<int> DeleteStudent(Students student)
        {
            var connectionString = ConnectionString();
            int i = 0;

            using (var con = new MySqlConnection(connectionString))
            {
                var str = "Delete From tblstudinfo" +
                    $" WHERE `id` = @id";
                try
                {
                    await con.OpenAsync().ConfigureAwait(false);
                    var com = new MySqlCommand(str, con)
                    {
                        CommandType = CommandType.Text
                    };

                    com.Parameters.Clear();
                    com.Parameters.AddWithValue("@id", student.id);
                    com.Parameters.AddWithValue("@fname", student.fname);
                    com.Parameters.AddWithValue("@mi", student.mi);
                    com.Parameters.AddWithValue("@lname", student.lname);
                    com.Parameters.AddWithValue("@bdate", student.bdate);
                    com.Parameters.AddWithValue("@address", student.address);
                    com.Parameters.AddWithValue("@email", student.email);

                    i = await com.ExecuteNonQueryAsync().ConfigureAwait(false);
                }
                catch (Exception ex)
                {

                    //throw;
                }
                finally
                {
                    await con.CloseAsync().ConfigureAwait(false);
                }
            }
            return i;
        }
    }
}
