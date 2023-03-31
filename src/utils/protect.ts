import { type GetServerSideProps, type GetServerSidePropsContext } from "next";

import { getServerAuthSession } from "../server/auth";

export const withAuth = (
    callback?: GetServerSideProps
) => {
    return async (context: GetServerSidePropsContext) => {
        const session = await getServerAuthSession({
            req: context.req,
            res: context.res,
        });

        if (!session) {
            return {
                redirect: {
                    destination: "/login?callbackUrl=" + context.resolvedUrl,
                    permanent: false,
                },
            };
        }

        return callback ? callback(context) : { props: {} };
    };
};
