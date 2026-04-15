using {sap.cap.university as uni} from '../db/schema';

@requires: 'Student'
service ModulesService {
        entity StudentModuleAssignment as projection on uni.StudentModuleAssignment;

        entity Modules                 as projection on uni.Modules
                actions {
                        action assign();
                        action unassign();
                };
}
