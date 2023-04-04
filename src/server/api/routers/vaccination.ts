import { vaccineData } from "@/utils/getData";
import { createTRPCRouter, protectedProcedure } from "../trpc";

export const vaccinationRouter = createTRPCRouter({
  getVacinations: protectedProcedure.query(({ ctx }) => {
    const { childDob } = ctx.session.user;

    const weeks = Math.floor(
      (new Date().getTime() - new Date(childDob).getTime()) /
        (1000 * 60 * 60 * 24 * 7)
    );

    return {
      childDob,
      weeks,
      vaccinations: vaccineData.map((v) => ({
        ...v,
        dueDate: new Date(
          childDob.getTime() + v.ageGroup * 7 * 24 * 60 * 60 * 1000
        ),
      })),
    };
  }),
});
