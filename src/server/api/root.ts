import { createTRPCRouter } from "@/server/api/trpc";
import { onboardingRouter } from "./routers/onboarding";
import { vaccinationRouter } from "./routers/vaccination";

/**
 * This is the primary router for your server.
 *
 * All routers added in /api/routers should be manually added here.
 */
export const appRouter = createTRPCRouter({
  onboarding: onboardingRouter,
  vaccination: vaccinationRouter,
});

// export type definition of API
export type AppRouter = typeof appRouter;
