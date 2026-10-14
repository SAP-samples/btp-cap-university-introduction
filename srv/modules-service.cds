using {sap.cap.university as uni} from '../db/schema';

@requires: 'Student'
@odata @mcp
service ModulesService {
        entity StudentModuleAssignment as projection on uni.StudentModuleAssignment;

        entity Modules                 as projection on uni.Modules
                actions {
                        action assign();
                        action unassign();
                };
}
