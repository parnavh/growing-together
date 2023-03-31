import { withAuth } from "@/utils/protect";
import type { FC } from "react";

export const getServerSideProps = withAuth();

const paediatricians: FC = () => {
  return <h1>Paediatricians</h1>;
};

export default paediatricians;
