//------------------------------------------------------------------------------
// <auto-generated>
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolManagementSystem.Main
{
    using System;
    using System.Collections.Generic;
    
    public partial class TeacherInfo
    {
        public TeacherInfo()
        {
            this.ClassRoutines = new HashSet<ClassRoutine>();
            this.UserCredentials = new HashSet<UserCredential>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public string Address { get; set; }
        public decimal ContactNo { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string Skills { get; set; }
        public int AssignSubID { get; set; }
    
        public virtual ICollection<ClassRoutine> ClassRoutines { get; set; }
        public virtual SubjectInfo SubjectInfo { get; set; }
        public virtual ICollection<UserCredential> UserCredentials { get; set; }
    }
}
