using {cuid} from '@sap/cds/common';

namespace sap.cap.university;

entity Modules {
        key moduleID       : UUID;
            study          : Association to one Studies;
            name           : String;
            credits        : Integer;
            weights        : Integer;
            hasFixedWeight : Boolean;
            validFrom      : Date;
            validTo        : Date;
            isMandatory    : Boolean;
            isFinalThesis  : Boolean;
            additionalInfo : String;
            assignments    : Association to many StudentModuleAssignment
                                     on assignments.module = $self;
}

entity StudentModuleAssignment : cuid {
        module  : Association to Modules;
        student : Association to Students;
}

entity Students {
        key userID    : UUID;
            firstName : String;
            lastName  : String;
            study     : Association to one Studies;
            modules   : Association to many StudentModuleAssignment
                                on modules.student = $self;
}

entity Studies {
        key studyID              : UUID;
            name                 : String;
            creditsForCompletion : Integer;
            duration             : Integer;
            modules              : Association to many Modules
                                           on modules.study = $self;
}
