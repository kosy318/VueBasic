import { bus } from "./EmpBus.js";

export default {
  template: `<div>
              <div class="input-group mb-3 w-50">
                  <input
                      type="search"
                      v-model="name"
                      @keyup.enter="search"
                      class="form-control"
                      placeholder=""
                  />
                  <div class="input-group-append">
                      <button @click="search" class="btn btn-dark" type="button">검색</button>
                  </div>
              </div>
            </div>`,
  data() {
    return {
      name: "",
    };
  },
  methods: {
    search() {
      bus.$emit("search", this.name);
    },
  },
};
