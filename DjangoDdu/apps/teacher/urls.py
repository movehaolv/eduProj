
from django.conf.urls import url,include

from .views import TeacherListView,TeacherDetailView,AddFavView


urlpatterns = [
    url(r'^list/$', TeacherListView.as_view(),name="list"),
    url(r'^detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(),name="detail"),
    url(r'^addfav/$', AddFavView.as_view(),name="add_fav"),
]
