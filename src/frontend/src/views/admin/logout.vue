<script>
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
        Sesion.close();
      }
      this.$router.push('/admin/signin');
    }
}
</script>