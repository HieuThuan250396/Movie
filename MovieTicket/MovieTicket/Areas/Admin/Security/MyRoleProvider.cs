﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;
using MovieTicket.Models;
namespace MovieTicket.Areas.Admin.Security
{
    public class MyRoleProvider : RoleProvider
    {
        public override string Name => base.Name;

        public override string Description => base.Description;

        public override string ApplicationName {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string[] GetRolesForUser(string username)
        {
            using (qldvEntities2 db = new qldvEntities2())
            {
                NhanVien user = db.NhanVien.FirstOrDefault(u => u.taikhoan.Equals(username, StringComparison.CurrentCultureIgnoreCase));

                var roles = user.vaitro;
                return new string[] { roles }; 
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            base.Initialize(name, config);
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            using (qldvEntities2 db = new qldvEntities2())
            {
                NhanVien user = db.NhanVien.FirstOrDefault(u => u.taikhoan.Equals(username, StringComparison.CurrentCultureIgnoreCase));

                var roles = user.vaitro;
                if (user != null)
                    return roles.Equals(roleName, StringComparison.CurrentCultureIgnoreCase);
                return false;
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}