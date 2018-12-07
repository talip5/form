from django import forms
from .models import Fihrist

class PostForm(forms.ModelForm):


    class Meta:
        model = Fihrist
        fields = [
            'title',
            'content',
        ]