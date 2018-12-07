from django.db import models

class Fihrist(models.Model):
    title = models.CharField(max_length=120)
    content = models.TextField()

    def __str__(self):
        return self.title


class Adres(models.Model):
    isim = models.CharField(max_length=30)
    soyad = models.TextField()

    def __str__(self):
        return self.isim



