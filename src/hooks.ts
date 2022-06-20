import "dotenv/config";
import type { GetSession } from "@sveltejs/kit";

export const getSession: GetSession = () => {
    return {
        todoAPIURL: process.env.TODO_API_URL || ""
    };
}
