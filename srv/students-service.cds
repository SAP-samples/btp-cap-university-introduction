using {sap.cap.university as uni} from '../db/schema';

service StudentsService {
        @odata.draft.enabled
        entity Students as projection on uni.Students;

        entity Studies  as projection on uni.Studies;
}
