class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def __str__(self):
        return f'Rectangle(width={self.width}, height={self.height})'
    
    def set_width(self,width):
        self.width = width

    def set_height(self,height):
        self.height = height

    def get_area(self):
        return self.width * self.height
    
    def get_perimeter(self):
        return (2* self.width) + (2 * self.height)
    
    def get_diagonal(self):
        return (((self.width ** 2) + (self.height ** 2)) ** 0.5)
    
    def get_picture(self):
        if self.width > 50 or self.height > 50:
            return 'Too big for picture.'
        
        picture = ''
        for i in range(self.height):
            picture = f'{picture}{self.width * "*"}\n'

        return picture
    
    def get_amount_inside(self, shape: 'Rectangle'):
        if shape.width > self.width or shape.height > self.height:
            return 0
        horizontal_fit = int (self.width / shape.width)
        vertical_fit = int(self.height / shape.height)
        amount_inside = horizontal_fit * vertical_fit
        return amount_inside

class Square(Rectangle):
    def __init__(self, side):
        self.width = side
        self.height = side

    def __str__(self):
        return f'Square(side={self.width})'
    
    def set_side(self, side):
        self.width = side
        self.height = side

    def set_width(self,width):
        self.width = width
        self.height = width

    def set_height(self,height):
        self.height = height
        self.width = height