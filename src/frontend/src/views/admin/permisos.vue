<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";
import { sha512 } from "js-sha512";

import Sesion from "@/services/Sesion";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';

import UsuarioController from "@/controllers/UsuarioController";
import EmpleadosController from "@/controllers/EmpleadosController";
import RolController from "@/controllers/RolController";
import LogService from "@/services/LogService";

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
            usuarios: [],
            empleados: [],
            roles: [],
            modal: false,
            nueva_contra: false,
            op_actualizar: false,
            persona: {},
            scripts: [
                '/libs/jquery/dist/jquery.min.js',
                '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
                '/js/sidebarmenu.js',
                '/js/app.min.js',
                '/libs/simplebar/dist/simplebar.js',

                /* solar icons */
                'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js'
            ]
        }
    },
    methods: {
        nuevo() {
            this.op_actualizar = false;
            this.nueva_contra = true;
            this.modal = true;

        },
        editar(usuario) {
            this.modal = true;
            this.persona = usuario;
            //Object.defineProperty(this.persona, 'nueva_contra', {value:false});
            this.nueva_contra = false;
            this.op_actualizar = true;
        },
        eliminar(usuario) {
            const cu = new UsuarioController(this.$_SERVER_NAME);
            cu.setControllerListener(response => {
                LogService.log(this.$_SERVER_NAME, "[PUT] :Se limino un usuario (parcial) > " + usuario.idUsuario);
                this.listarUsuarios();
            });
            usuario.estado = 0;
            cu.actualizar(usuario.idUsuario, usuario);
        },
        cambiarEstado() {
            this.nueva_contra = !this.nueva_contra;
        },
        guardarDatos() {
            if (this.op_actualizar) {
                this.actualizar(1);
            } else {
                const datos = {
                    usuario: this.html('c_nombreusuario').value,
                    password: sha512(this.html('c_companypass').value),
                    estado: 1,
                    idEmpleado: parseInt(this.html('c_empleado_datos').value),
                    idRol: parseInt(this.html('c_rol').value)
                };

                //console.log(datos)

                const cu = new UsuarioController(this.$_SERVER_NAME);
                cu.setControllerListener(response => {
                    LogService.log(this.$_SERVER_NAME, "[POST] :Se agrego un nuevo usuario > " + datos.usuario);
                    this.listarUsuarios();
                });
                cu.guardar(datos);

                this.modal = false;
            }
        },
        actualizar(bit_estado) {
            const datos = {
                idUsuario: this.persona.idUsuario,
                usuario: this.html('c_nombreusuario').value,
                password: this.nueva_contra ? sha512(this.html('c_companypass').value) :this.persona.password,
                estado: bit_estado,
                idEmpleado: parseInt(this.html('c_empleado_datos').value),
                idRol: parseInt(this.html('c_rol').value)
            };
            
            // console.log(this.nueva_contra)

            const cu = new UsuarioController(this.$_SERVER_NAME);
            cu.setControllerListener(response => {
                LogService.log(this.$_SERVER_NAME, "[PUT] :Se actualizo un usuario > " + datos.usuario);
                this.listarUsuarios();
            });
            cu.actualizar(datos.idUsuario, datos);

            this.modal = false;
        },
        html(myId) {
            return document.getElementById(myId);
        },
        listarUsuarios() {
            const cu = new UsuarioController(this.$_SERVER_NAME);
            cu.setControllerListener(response => {
                LogService.log(this.$_SERVER_NAME, "[GET] :Consulto los usuarios");
                this.usuarios = response;
            });
            cu.listarTodo();

            const ce = new EmpleadosController(this.$_SERVER_NAME);
            ce.setControllerListener(response => {
                LogService.log(this.$_SERVER_NAME, "[GET] :Consulto los empleados");
                this.empleados = response;
            });
            ce.listarTodo();

            const cr = new RolController(this.$_SERVER_NAME);
            cr.setControllerListener(response => {
                LogService.log(this.$_SERVER_NAME, "[GET] :Consulto los roles");
                this.roles = response;
            });
            cr.listarTodo();
        }
    },
    beforeMount() {
        if (!Sesion.check()) {
            this.$router.push('/admin/signin');
        }
    },
    mounted() {
        this.scripts.forEach((element) => {
            loadScript(element)
                .then(() => {
                    if (this.$DEBUG) {
                        console.info('[ ok ] :Load Script (', element, ')')
                    }
                })
                .catch(() => {
                    if (this.$DEBUG) {
                        console.error('[ error ] :Load Script {', element, '}')
                    }
                });
        })

        this.listarUsuarios();
    },
    unmounted() {
        this.scripts.forEach((element) => {
            unloadScript(element)
                .then(() => {
                    if (this.$DEBUG) {
                        console.info('[ ok ] :Unload Script', element)
                    }
                })
                .catch(() => {
                    if (this.$DEBUG) {
                        console.error('[ error ] :Unload Script', element)
                    }
                });
        })
    }
}
</script>

<template>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <Sidebar></Sidebar>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <Navbar></Navbar>
            <!--  Header End -->
            <div class="body-wrapper-inner">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Gestión - Usuario</h5>
                            <p><button type="button" class="btn btn-secondary m-1" @click="nuevo()">Agregar Usuario</button> </p>
                            
                        </div>
                        <div>
                            <table class="table table-hove">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">
                                            <h6>Usuario</h6>
                                        </th>
                                        <th scope="col">
                                            <h6>Rol (Nivel en Sistema)</h6>
                                        </th>
                                        <th scope="col">
                                            <h6>Acción</h6>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(element, index) in usuarios" :key="index">
                                        <td>{{ element.idUsuario }}</td>
                                        <td>{{ element.usuario }}</td>
                                        <td>{{ element.nombre }}</td>
                                        <td>
                                            <button type="button" class="btn btn-warning m-1"
                                                @click="editar(element)">Editar</button>
                                            <button type="button" class="btn btn-danger m-1"
                                                @click="eliminar(element)">Eliminar</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal formulario para ingresar un producto-->
    <div v-if="modal" class="modal-overlay" @click="modal = !modal">
        <div class="modal-content" @click.stop>
            <br><br><br><br>
            <div class="row mb-5">
                <div class="col-md-12 text-center">
                    <div class="card">
                        <form @submit.prevent="prevent">
                            <div class="card-body">
                                <br>
                                <h1 class="h1 mb-3 text-black">Editar Usuario</h1>
                                <div class="row">
                                    <div class="col-md-6 mb-5 mb-md-0">
                                        <h2 class="h3 mb-3 text-black">Persona</h2>
                                        <div class="p-3 p-lg-5 border bg-white">
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label for="c_fname" class="text-black">Empleado<span
                                                            class="text-danger">*</span></label>
                                                    <select class="form-control" id="c_empleado_datos">
                                                        <option v-for="(entry, index) in empleados"
                                                        :value="entry.idEmpleado" 
                                                        :selected="entry.idEmpleado == persona.idEmpleado">
                                                            {{ entry.nombre }}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group row">
                                                <div class="col-md-12">
                                                    <label for="c_companyname" class="text-black">Nombre Usuario<span
                                                            class="text-danger">*</span> </label>
                                                    <input type="text" class="form-control" id="c_nombreusuario"
                                                        name="c_companyname" :value="persona.usuario">
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label for="c_order_notes" class="text-black">Contraseña</label>
                                                <input type="password" class="form-control" id="c_companypass"
                                                        name="c_companyname" :disabled="!nueva_contra" />
                                                <input v-if="op_actualizar" type="checkbox" name="n" id="n" @click="cambiarEstado()"><label for="n">Nueva contraseña</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row mb-5">
                                            <div class="col-md-12">
                                                <h2 class="h3 mb-3 text-black">Permisos</h2>
                                                <div class="p-3 p-lg-5 border bg-white">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <label for="precio_venta" class="text-black">Rol<span
                                                                    class="text-danger">* </span></label>
                                                                    <select class="form-control" id="c_rol">
                                                                    <option v-for="(entry, index) in roles" 
                                                                    :value="entry.idRol" 
                                                                    :selected="entry.idRol == persona.idRol">
                                                                        {{ entry.nombre }}
                                                                    </option>
                                                                </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-light m-1" @click="modal = !modal">
                                    Cancelar
                                </button>
                                <p>&nbsp; &nbsp; </p>
                                <button type="submit" class="btn btn-success m-1" @click="guardarDatos()">
                                    Guardar
                                </button>
                            </div>
                            <br>
                            <br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>