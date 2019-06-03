using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class EmployeeController : ApiController
    {
        private EventSchedulerEntities db = new EventSchedulerEntities();

        // GET: api/Employee
        public IQueryable<EmployeeOne> GetEmployeeOnes()
        {
            return db.EmployeeOnes;
        }

        // GET: api/Employee/5
        [ResponseType(typeof(EmployeeOne))]
        public IHttpActionResult GetEmployeeOne(int id)
        {
            EmployeeOne employeeOne = db.EmployeeOnes.Find(id);
            if (employeeOne == null)
            {
                return NotFound();
            }

            return Ok(employeeOne);
        }

        // PUT: api/Employee/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEmployeeOne(int id, EmployeeOne employeeOne)
        {
            if (id != employeeOne.EmployeeID)
            {
                return BadRequest();
            }

            db.Entry(employeeOne).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmployeeOneExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Employee
        [ResponseType(typeof(EmployeeOne))]
        public IHttpActionResult PostEmployeeOne(EmployeeOne employeeOne)
        {
            db.EmployeeOnes.Add(employeeOne);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = employeeOne.EmployeeID }, employeeOne);
        }

        // DELETE: api/Employee/5
        [ResponseType(typeof(EmployeeOne))]
        public IHttpActionResult DeleteEmployeeOne(int id)
        {
            EmployeeOne employeeOne = db.EmployeeOnes.Find(id);
            if (employeeOne == null)
            {
                return NotFound();
            }

            db.EmployeeOnes.Remove(employeeOne);
            db.SaveChanges();

            return Ok(employeeOne);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EmployeeOneExists(int id) => db.EmployeeOnes.Count(e => e.EmployeeID == id) > 0;
    }
}