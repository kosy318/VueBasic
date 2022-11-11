import Vue from "vue";
import VueRouter from "vue-router";
import TodoList from "@/components/todo/TodoList";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "main",
    redirect: "/todo/list",
  },
  {
    path: "/todo",
    name: "todo",
    component: () => import("@/views/AppTodo"),
    redirect: "/todo/list",
    children: [
      {
        path: "list",
        name: "todolist",
        component: TodoList,
      },
      {
        path: "insert",
        name: "todoinsert",
        component: () => import("@/components/todo/TodoInsert"),
      },
      {
        path: ":num",
        name: "tododetail",
        component: () => import("@/components/todo/TodoDetail"),
      },
      {
        path: "modify/:num",
        name: "todomodify",
        component: () => import("@/components/todo/TodoModify"),
      },
    ],
  },
];

const router = new VueRouter({
  // mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
