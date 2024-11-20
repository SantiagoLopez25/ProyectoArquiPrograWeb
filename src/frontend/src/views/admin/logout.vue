<script>
import LogService from "@/services/LogService";
import Sesion from "@/services/Sesion";

export default {
    page: {},
    components: { },
    data() {
        return { }
    },
    methods: {
        
    },
    beforeMount() {      
      Sesion.close();
      sessionStorage.clear();
      this.$router.push('/admin/signin');
    }
}
</script>