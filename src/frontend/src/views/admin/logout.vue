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
      if (Sesion.check()) {        
        LogService.listener(data => {
          Sesion.close();
        });     
        LogService.log(this.$_SERVER_NAME, "cerrar sesión");   
      }      
      sessionStorage.clear();
      this.$router.push('/admin/signin');
    }
}
</script>