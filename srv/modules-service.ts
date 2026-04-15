import cds from "@sap/cds";
import { Module, StudentModuleAssignment } from "#cds-models/ModulesService";

const { SELECT, INSERT, DELETE } = cds.ql;

export class ModulesService extends cds.ApplicationService {
  init() {
    const { Students, StudentModuleAssignment: SMA } = cds.entities("sap.cap.university");

    this.on(Module.actions.assign, async (req) => {
      const { moduleID } = req.params[0] as { moduleID: string };
      const userId = req.user.id;

      // Find the student record matching the logged-in user
      const student = await SELECT.one.from(Students).where({ userID: userId });
      if (!student) {
        return req.error(404, "No student record found for the current user.");
      }

      // Check if the assignment already exists
      const existing = await SELECT.one
        .from(SMA)
        .where({ module_moduleID: moduleID, student_userID: student.userID });

      if (existing) {
        return req.error(409, "You are already assigned to this module.");
      }

      // Create the assignment
      await INSERT.into(SMA).entries({
        module_moduleID: moduleID,
        student_userID: student.userID,
      });

      return req.info("Successfully assigned to the module.");
    });

    this.on(Module.actions.unassign, async (req) => {
      const { moduleID } = req.params[0] as { moduleID: string };
      const userId = req.user.id;

      // Find the student record matching the logged-in user
      const student = await SELECT.one.from(Students).where({ userID: userId });
      if (!student) {
        return req.error(404, "No student record found for the current user.");
      }

      // Check if the assignment exists
      const existing = await SELECT.one
        .from(SMA)
        .where({ module_moduleID: moduleID, student_userID: student.userID });

      if (!existing) {
        return req.error(404, "You are not assigned to this module.");
      }

      // Delete the assignment
      await DELETE.from(SMA).where({
        module_moduleID: moduleID,
        student_userID: student.userID,
      });

      return req.info("Successfully unassigned from the module.");
    });

    return super.init();
  }
}
