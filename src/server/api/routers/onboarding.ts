import { createTRPCRouter, protectedProcedure } from "../trpc";
import { z } from "zod";

export const onboardingRouter = createTRPCRouter({
  createProfile: protectedProcedure
    .input(
      z.object({
        parentName: z.string(),
        parentAge: z.number(),
        childName: z.string(),
        childDob: z.date(),
        city: z.string(),
        pinCode: z.string(),
        annualIncome: z.number(),
      })
    )
    .mutation(async ({ input, ctx }) => {
      const {
        parentName,
        parentAge,
        childName,
        childDob,
        city,
        pinCode,
        annualIncome,
      } = input;
      const profile = await ctx.prisma.user.update({
        data: {
          name: parentName,
          parentAge,
          childName,
          childDob,
          city,
          pinCode,
          annualIncome,
        },
        where: {
          id: ctx.session.user.id,
        },
      });
      return profile;
    }),
});
