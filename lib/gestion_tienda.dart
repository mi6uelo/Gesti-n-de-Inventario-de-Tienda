class Producto {
  String nombre;
  double precio;
  int cantidadEnStock;
  String categoria;

  Producto({
    required this.nombre,
    required this.precio,
    required this.cantidadEnStock,
    required this.categoria,
  });

  @override
  String toString() {
    return 'Nombre: $nombre, Precio: \$$precio, Stock: $cantidadEnStock, Categoría: $categoria';
  }
}

class Inventario {
  List<Producto> productos = [];

  // Agregar un nuevo producto al inventario
  void agregarProducto(Producto producto) {
    productos.add(producto);
    print('Producto agregado: ${producto.nombre}');
  }

  // Buscar productos por nombre
  void buscarPorNombre(String nombre) {
    List<Producto> resultados = productos
        .where(
            (producto) => producto.nombre.toLowerCase() == nombre.toLowerCase())
        .toList();
    if (resultados.isNotEmpty) {
      print('Productos encontrados con el nombre $nombre:');
      resultados.forEach((producto) => print(producto));
    } else {
      print('No se encontraron productos con el nombre $nombre.');
    }
  }

  // Buscar productos por categoría
  void buscarPorCategoria(String categoria) {
    List<Producto> resultados = productos
        .where((producto) =>
            producto.categoria.toLowerCase() == categoria.toLowerCase())
        .toList();
    if (resultados.isNotEmpty) {
      print('Productos en la categoría $categoria:');
      resultados.forEach((producto) => print(producto));
    } else {
      print('No se encontraron productos en la categoría $categoria.');
    }
  }

  // Actualizar la cantidad en stock de un producto
  void actualizarStock(String nombre, int nuevaCantidad) {
    Producto? producto = productos.firstWhere(
        (producto) => producto.nombre.toLowerCase() == nombre.toLowerCase(),
        orElse: () =>
            Producto(nombre: '', precio: 0, cantidadEnStock: 0, categoria: ''));
    if (producto.nombre != '') {
      producto.cantidadEnStock = nuevaCantidad;
      print('El stock de $nombre ha sido actualizado a $nuevaCantidad.');
    } else {
      print('No se encontró el producto $nombre para actualizar.');
    }
  }

  // Calcular el valor total del inventario
  double calcularValorTotalInventario() {
    double total = productos.fold(0,
        (sum, producto) => sum + (producto.precio * producto.cantidadEnStock));
    return total;
  }

  // Mostrar todos los productos de una categoría específica
  void mostrarProductosPorCategoria(String categoria) {
    List<Producto> resultados = productos
        .where((producto) =>
            producto.categoria.toLowerCase() == categoria.toLowerCase())
        .toList();
    if (resultados.isNotEmpty) {
      print('Productos en la categoría $categoria:');
      resultados.forEach((producto) => print(producto));
    } else {
      print('No hay productos en la categoría $categoria.');
    }
  }
}
