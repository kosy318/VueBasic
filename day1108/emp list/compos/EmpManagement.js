import empHeader from "./EmpHeader.js";
import empSearch from "./EmpSearch.js";
import empList from "./EmpList.js";

export default {
  template: `<div>
              <emp-header></emp-header>
              <emp-search></emp-search>
              <emp-list></emp-list>
            </div>`,
  components: {
    empHeader,
    empSearch,
    empList,
  },
};
