//------------------------------------------------------------------------------
// <auto-generated>

//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolManagementSystem.Main
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClassInfo
    {
        public ClassInfo()
        {
            this.CurriculumDetails = new HashSet<CurriculumDetail>();
            this.SectionInfoes = new HashSet<SectionInfo>();
            this.StudentInfoes = new HashSet<StudentInfo>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public int Year { get; set; }
    
        public virtual ICollection<CurriculumDetail> CurriculumDetails { get; set; }
        public virtual ICollection<SectionInfo> SectionInfoes { get; set; }
        public virtual ICollection<StudentInfo> StudentInfoes { get; set; }
    }
}
