# Generated by Django 5.0.6 on 2024-06-08 11:01

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('etudiant', '0002_indispoenseignant_start_lt_end'),
    ]

    operations = [
        migrations.AddField(
            model_name='division',
            name='surDivision',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='etudiant.division'),
        ),
    ]