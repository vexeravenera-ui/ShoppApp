from django import forms

from shopapp.models import Product


class MultipleFileInput(forms.FileInput):
    allow_multiple_selected = True


class ProductForm(forms.ModelForm):
    images = forms.FileField(
        widget=MultipleFileInput(attrs={"multiple": True}),
        required=False,
    )

    class Meta:
        model = Product
        fields = ("name", "price", "description", "discount", "preview")


class CSVImportForm(forms.Form):
    csv_file = forms.FileField(label="Выберите CSV файл")