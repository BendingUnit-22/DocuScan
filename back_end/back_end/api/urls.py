from django.conf.urls import url, include
from back_end.api import views

# router = routers.DefaultRouter()
# router.register(r'users', views.UserViewSet)
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^upload/', views.upload, name="upload"),
    url(r'^$', views.FormBuilderView.as_view()),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
]