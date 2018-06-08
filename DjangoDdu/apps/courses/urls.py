
from django.conf.urls import url,include

from .views import CourseListView,CourseDetailView,CourseAddFav,CourseInfoView,CommentView


urlpatterns = [
    url(r'^lists/$', CourseListView.as_view(),name="list"),
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(),name="detail"),
    url(r'^add_fav/$',CourseAddFav.as_view(),name="add_fav"),
    url(r'^info/(?P<course_id>\d+)/$',CourseInfoView.as_view(),name="info"),
    url(r'^comment/(?P<course_id>\d+)/$',CommentView.as_view(),name="comment"),
]
