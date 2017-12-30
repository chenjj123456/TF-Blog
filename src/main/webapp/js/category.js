//1.定义模板
const listGroup = Vue.extend({
    template:
    "<div id='list' class=\"list-group\">\n" +
    "    <a v-for=\"item in items\" class=\"list-group-item\">\n" +
    "        <h4 class=\"list-group-item-heading\">\n" +
    "            {{ item.name }}\n" +
    "        </h4>\n" +
    "        <span class=\"text-muted\">{{ item.description }}.</span>\n" +
    "    </a>\n" +
    "</div>",
    data: function () {
        return {
            items: null
        }
    },
    created:function () {
        // 组件创建完后获取数据，
        // 此时 data 已经被 observed 了

        this.fetchData()
    },
    watch: {
        // 如果路由有变化，会再次执行该方法
        '$route': 'fetchData'
    },
    methods: {
        fetchData:function(){
            this.items = null;
            var resp = null;
            $.ajax({
                url : 'categoryServlet',
                type : 'POST',
                async : false,
                data : {
                    id:this.$route.params.id
                },
                success : function(data) {
                    resp = eval(data);
                },
                error : function() {
                    resp = eval(data);
                }
            });
            this.items = resp;
        }
    }
})

// 2. 定义路由
const routes = [
    { path: '/category/:id', component: listGroup }
]

// 3. 创建 router 实例，然后传 `routes` 配置
const router = new VueRouter({
    routes: routes // （缩写）相当于 routes: routes
})

// 4. 创建和挂载根实例。
const app = new Vue({
    router: router,
    data: {
        sites: [
            { name: 'Runoob',url:'/category/1' },
            { name: 'Google',url:'/category/2' },
            { name: 'Taobao',url:'/category/3' }
        ]
    }
}).$mount('#app')
